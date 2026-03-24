# Agent / contributor guide

This document orients anyone (human or automated) working on **Recipe Box**: a Flutter app using **Drift** (SQLite) for local data, with recipes, pantry, meal planning, shopping lists, and settings. Operational commands and troubleshooting live in [README.md](README.md).

## Tech stack (short)

- **Flutter / Dart** — UI and app shell; targets include macOS, Windows, Linux, iOS, Android, web.
- **Drift** — schema in [`lib/data/app_database.dart`](lib/data/app_database.dart); generated [`lib/data/app_database.g.dart`](lib/data/app_database.g.dart) must not be edited by hand.
- **go_router** — navigation with a responsive shell (rail vs bottom bar).
- **CocoaPods** — iOS/macOS native deps; [`ios/Podfile`](ios/Podfile) and [`macos/Podfile`](macos/Podfile) include a `sqlite3` warning-suppression hook for third-party C builds.

## Layout

- [`lib/core/`](lib/core/) — theme, breakpoints, router, shell, date helpers.
- [`lib/data/`](lib/data/) — Drift database and queries.
- [`lib/domain/`](lib/domain/) — pure Dart: tags, meal planner scoring, shopping list builder.
- [`lib/features/`](lib/features/) — feature screens (recipes, pantry, meal plan, shopping list, settings).
- [`test/`](test/) — widget and unit tests.

Prefer **small, focused changes** that match existing patterns. After schema changes, run `dart run build_runner build --delete-conflicting-outputs`.

## Verification before finishing work

```bash
flutter analyze
flutter test
```

Use `flutter run -d <device>` when validating UI. See [README.md](README.md) for devices and codegen.

---

## Semantic Versioning (SemVer)

We follow [SemVer 2.0.0](https://semver.org/): **MAJOR.MINOR.PATCH** (+ optional build metadata).

The canonical version for this app is **`version` in [`pubspec.yaml`](pubspec.yaml)**:

```yaml
version: 1.2.3+4
```

- **`1.2.3`** — SemVer **MAJOR.MINOR.PATCH** (what users and release notes care about).
- **`+4`** — **build number** (integer). Bump per store submission or CI build when required; it does not change SemVer precedence.

### When to bump what

| Bump | When |
|------|------|
| **MAJOR** | Breaking changes for users or integrators (e.g. data migration that drops/renames fields without a path, removed features, incompatible file formats). |
| **MINOR** | New functionality in a backward-compatible way (new screens, new optional fields, new exports). |
| **PATCH** | Backward-compatible fixes (bugs, crashes, incorrect behavior, dependency patches that do not change the public app contract). |

**Prereleases** (optional): `1.3.0-beta.1+10` is acceptable if you need pre-release channels; keep the `+build` part consistent with store rules.

**Rule of thumb:** If the change would surprise someone upgrading without reading notes, it likely needs **MAJOR** or a documented migration (and often still MAJOR if migration is manual).

Update `pubspec.yaml` in the **same commit** (or same PR) as the release-worthy change when cutting a release; day-to-day feature PRs may defer version bumps to whoever tags the release, but **releases must not ship without a coherent SemVer bump**.

---

## Conventional Commits

Commit messages (and ideally PR titles) follow [Conventional Commits 1.0.0](https://www.conventionalcommits.org/en/v1.0.0/).

### Format

```
<type>[optional scope][!]: <description>

[optional body]

[optional footer(s)]
```

- **type** (common): `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`, `revert`.
- **scope** (optional): short area, e.g. `recipes`, `pantry`, `meal-plan`, `drift`, `ios`, `macos`.
- **!** or **BREAKING CHANGE:** footer — marks a breaking change (align with **SemVer MAJOR**).

### Examples

```text
feat(meal-plan): show gap summary when expanding suggestions

fix(pantry): guard context after async when adding items

docs(readme): add simulator runtime troubleshooting

chore(deps): bump drift to 2.32.x

feat(recipes)!: remove legacy import format

BREAKING CHANGE: JSON export v1 is no longer supported; use v2 only.
```

### Rules

- Use **imperative mood** in the subject line (“add”, “fix”, not “added”, “fixes”).
- Keep the **subject ≤ ~72 characters**; put detail in the body.
- One logical change per commit when practical; squash in PRs is fine if the **merge commit** or **squashed message** stays conventional.
- **Link `feat`/`fix` to SemVer:** `fix` → PATCH (usually), `feat` → MINOR (unless `!` / breaking → MAJOR).

---

## Release checklist (human or automated)

1. `flutter analyze` and `flutter test` pass.
2. `pubspec.yaml` version updated per SemVer (and build `+N` if needed).
3. Changelog or release notes updated if the project uses them.
4. Tag: `vMAJOR.MINOR.PATCH` (e.g. `v1.4.0`) matching `pubspec`’s SemVer portion.

---

## What not to do

- Do not hand-edit **`*.g.dart`** Drift outputs.
- Do not strip **`$(inherited)`** from CocoaPods `OTHER_CFLAGS` when adjusting Podfiles.
- Avoid drive-by refactors unrelated to the task; keep diffs reviewable.

Optional: add [Cursor rules](https://docs.cursor.com/context/rules) under `.cursor/rules/` for editor-specific hints.

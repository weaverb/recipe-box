# Recipe Box

Cross-platform Flutter app for recipes, pantry inventory, meal planning (with pantry-aware suggestions), and grocery lists. Data is stored locally with [Drift](https://drift.simonbinder.eu/) (SQLite).

## Prerequisites

- [Flutter](https://docs.flutter.dev/get-started/install) (stable channel), including the desktop and/or mobile tooling you plan to use.
- Run `flutter doctor` and fix any issues for your targets (e.g. Xcode for iOS/macOS, Android SDK for Android).

### Xcode: “Unable to get list of installed Simulator runtimes”

That message is **not** CocoaPods. It means **no iOS Simulator runtime** is installed yet (common with newer Xcode: simulators are a separate download).

**Option A — command line (leave it running; download is several GB):**

```bash
xcodebuild -downloadPlatform iOS
```

**Option B — Xcode UI:** Xcode → **Settings** → **Components** (or **Platforms**) → download the **iOS … Simulator** runtime.

Confirm:

```bash
xcrun simctl list runtimes
```

You should see at least one `iOS` runtime. Then `flutter doctor` should clear that check.

## Getting started

From the repository root:

```bash
flutter pub get
```

If generated Drift files are missing or you changed the database schema (see **Maintaining**), run code generation first.

## Running the app

List available devices:

```bash
flutter devices
```

Run on a specific device:

```bash
flutter run -d macos
flutter run -d windows
flutter run -d linux
flutter run -d chrome
flutter run -d ios
flutter run -d android
```

Release build examples:

```bash
flutter build macos
flutter build apk
flutter build ios
```

### Web and Chrome

If `flutter doctor` reports no Chrome, you can point Flutter at another Chromium-based browser (e.g. Brave on macOS):

```bash
export CHROME_EXECUTABLE="/Applications/Brave Browser.app/Contents/MacOS/Brave Browser"
```

## Testing and analysis

Run all tests:

```bash
flutter test
```

Run static analysis:

```bash
flutter analyze
```

## Maintaining the app

Contributors and automation should follow [AGENTS.md](AGENTS.md) for repository layout, **Semantic Versioning** (`pubspec.yaml`), **Conventional Commits**, and release expectations.

### Drift code generation

The database schema lives in [`lib/data/app_database.dart`](lib/data/app_database.dart). Drift generates [`lib/data/app_database.g.dart`](lib/data/app_database.g.dart); that file should not be edited by hand.

After you change tables, columns, or queries that use code generation:

```bash
dart run build_runner build --delete-conflicting-outputs
```

To watch for changes during development:

```bash
dart run build_runner watch --delete-conflicting-outputs
```

### Schema migrations

When you bump `schemaVersion` and add migration steps in `AppDatabase`, run the app once so migrations apply. Test upgrades from an older schema when possible (e.g. keep a copy of an old SQLite file).

### Dependencies

Check for newer packages:

```bash
flutter pub outdated
```

Upgrade within current constraints:

```bash
flutter pub upgrade
```

After dependency or SDK upgrades, run `flutter analyze` and `flutter test`.

### Linting

Lint rules are configured in [`analysis_options.yaml`](analysis_options.yaml) (via `flutter_lints`).

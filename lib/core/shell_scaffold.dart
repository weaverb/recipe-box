import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShellScaffold extends StatelessWidget {
  const ShellScaffold({
    super.key,
    required this.navigationShell,
    required this.compact,
  });

  final StatefulNavigationShell navigationShell;
  final bool compact;

  static const _destinations = <_NavDest>[
    _NavDest('Recipes', Icons.menu_book_outlined, Icons.menu_book),
    _NavDest('Pantry', Icons.kitchen_outlined, Icons.kitchen),
    _NavDest('Meal plan', Icons.calendar_month_outlined, Icons.calendar_month),
    _NavDest('Shopping', Icons.shopping_cart_outlined, Icons.shopping_cart),
    _NavDest('Settings', Icons.settings_outlined, Icons.settings),
  ];

  @override
  Widget build(BuildContext context) {
    if (compact) {
      return Scaffold(
        body: SafeArea(bottom: false, child: navigationShell),
        bottomNavigationBar: NavigationBar(
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: navigationShell.goBranch,
          destinations: [
            for (final d in _destinations)
              NavigationDestination(
                icon: Icon(d.outlined),
                selectedIcon: Icon(d.filled),
                label: d.label,
              ),
          ],
        ),
      );
    }

    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: navigationShell.currentIndex,
            onDestinationSelected: navigationShell.goBranch,
            labelType: NavigationRailLabelType.all,
            destinations: [
              for (final d in _destinations)
                NavigationRailDestination(
                  icon: Icon(d.outlined),
                  selectedIcon: Icon(d.filled),
                  label: Text(d.label),
                ),
            ],
          ),
          const VerticalDivider(width: 1),
          Expanded(child: navigationShell),
        ],
      ),
    );
  }
}

class _NavDest {
  const _NavDest(this.label, this.outlined, this.filled);

  final String label;
  final IconData outlined;
  final IconData filled;
}

import 'package:flutter/material.dart';

import '../../core/constants/app_constants.dart';
import '../../core/localization/myanmar_text.dart';
import 'responsive_breakpoints.dart';

class NavigationDestinationItem {
  const NavigationDestinationItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
  });

  final IconData icon;
  final IconData selectedIcon;
  final String label;
}

class NavigationShell extends StatelessWidget {
  const NavigationShell({required this.currentIndex, required this.onSelect, super.key});

  final int currentIndex;
  final ValueChanged<int> onSelect;

  static const items = <NavigationDestinationItem>[
    NavigationDestinationItem(
      icon: Icons.home_outlined,
      selectedIcon: Icons.home,
      label: MyText.home,
    ),
    NavigationDestinationItem(
      icon: Icons.menu_book_outlined,
      selectedIcon: Icons.menu_book,
      label: MyText.courses,
    ),
    NavigationDestinationItem(
      icon: Icons.emoji_events_outlined,
      selectedIcon: Icons.emoji_events,
      label: MyText.achievements,
    ),
    NavigationDestinationItem(
      icon: Icons.person_outline,
      selectedIcon: Icons.person,
      label: MyText.profile,
    ),
    NavigationDestinationItem(
      icon: Icons.settings_outlined,
      selectedIcon: Icons.settings,
      label: MyText.settings,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final type = deviceTypeForWidth(MediaQuery.sizeOf(context).width);
    final isMobile = type == AppDeviceType.mobile;

    if (isMobile) {
      return NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: onSelect,
        destinations: [
          for (final item in items)
            NavigationDestination(
              icon: Icon(item.icon),
              selectedIcon: Icon(item.selectedIcon),
              label: item.label,
            ),
        ],
      );
    }

    return NavigationRail(
      selectedIndex: currentIndex,
      onDestinationSelected: onSelect,
      extended: type == AppDeviceType.desktop,
      labelType: type == AppDeviceType.tablet
          ? NavigationRailLabelType.all
          : NavigationRailLabelType.none,
      leading: Padding(
        padding: const EdgeInsets.only(bottom: AppConstants.defaultPadding),
        child: Icon(
          Icons.code_rounded,
          color: Theme.of(context).colorScheme.primary,
          size: 32,
        ),
      ),
      destinations: [
        for (final item in items)
          NavigationRailDestination(
            icon: Icon(item.icon),
            selectedIcon: Icon(item.selectedIcon),
            label: Text(item.label),
          ),
      ],
    );
  }
}

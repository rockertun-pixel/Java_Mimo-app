import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/theme/theme_controller.dart';
import '../../../core/localization/myanmar_text.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTheme = ref.watch(themeControllerProvider);
    final themeController = ref.read(themeControllerProvider.notifier);
    final systemBrightness = MediaQuery.platformBrightnessOf(context);
    final effectiveBrightness = selectedTheme == ThemeMode.dark
        ? Brightness.dark
        : selectedTheme == ThemeMode.light
            ? Brightness.light
            : systemBrightness;

    return ListView(
      children: [
        Text(MyText.settings, style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 8),
        const Text(MyText.themeDescription),
        const SizedBox(height: 24),
        _CurrentThemeCard(
          selectedTheme: selectedTheme,
          effectiveBrightness: effectiveBrightness,
        ),
        const SizedBox(height: 20),
        Text(MyText.chooseTheme, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        _ThemeOptionTile(
          icon: Icons.brightness_auto_outlined,
          title: MyText.system,
          description: MyText.systemDescription,
          value: ThemeMode.system,
          selectedValue: selectedTheme,
          onChanged: themeController.setTheme,
        ),
        const SizedBox(height: 12),
        _ThemeOptionTile(
          icon: Icons.light_mode_outlined,
          title: MyText.light,
          description: MyText.lightDescription,
          value: ThemeMode.light,
          selectedValue: selectedTheme,
          onChanged: themeController.setTheme,
        ),
        const SizedBox(height: 12),
        _ThemeOptionTile(
          icon: Icons.dark_mode_outlined,
          title: MyText.dark,
          description: MyText.darkDescription,
          value: ThemeMode.dark,
          selectedValue: selectedTheme,
          onChanged: themeController.setTheme,
        ),
        const SizedBox(height: 20),
        const Text(MyText.savedLocally),
      ],
    );
  }
}

class _CurrentThemeCard extends StatelessWidget {
  const _CurrentThemeCard({
    required this.selectedTheme,
    required this.effectiveBrightness,
  });

  final ThemeMode selectedTheme;
  final Brightness effectiveBrightness;

  String get _selectedLabel {
    switch (selectedTheme) {
      case ThemeMode.system:
        return MyText.system;
      case ThemeMode.light:
        return MyText.light;
      case ThemeMode.dark:
        return MyText.dark;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = effectiveBrightness == Brightness.dark;
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      color: colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Icon(
              isDark ? Icons.dark_mode : Icons.light_mode,
              size: 36,
              color: colorScheme.onPrimaryContainer,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(MyText.activeTheme,
                      style: Theme.of(context).textTheme.labelLarge),
                  const SizedBox(height: 4),
                  Text(
                    _selectedLabel,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    isDark ? 'လက်ရှိအရောင်: အမှောင်' : 'လက်ရှိအရောင်: အလင်း',
                    style: TextStyle(color: colorScheme.onPrimaryContainer),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ThemeOptionTile extends StatelessWidget {
  const _ThemeOptionTile({
    required this.icon,
    required this.title,
    required this.description,
    required this.value,
    required this.selectedValue,
    required this.onChanged,
  });

  final IconData icon;
  final String title;
  final String description;
  final ThemeMode value;
  final ThemeMode selectedValue;
  final ValueChanged<ThemeMode> onChanged;

  @override
  Widget build(BuildContext context) {
    final selected = value == selectedValue;
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => onChanged(value),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              Icon(icon, color: selected ? colorScheme.primary : null),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 3),
                    Text(description, style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ),
              Radio<ThemeMode>(
                value: value,
                groupValue: selectedValue,
                onChanged: (next) {
                  if (next != null) onChanged(next);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

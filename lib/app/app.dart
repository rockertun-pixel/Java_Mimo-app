import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/achievements/presentation/achievements_screen.dart';
import '../features/courses/presentation/courses_screen.dart';
import '../features/home/presentation/home_screen.dart';
import '../features/profile/presentation/profile_screen.dart';
import '../features/settings/presentation/settings_screen.dart';
import 'responsive/responsive_scaffold.dart';
import 'theme/app_theme.dart';
import 'theme/theme_controller.dart';

class CodeLearnApp extends ConsumerWidget {
  const CodeLearnApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeControllerProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ကုဒ်လေ့လာမယ်',
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: themeMode,
      home: const AppHomePage(),
    );
  }
}

class AppHomePage extends StatefulWidget {
  const AppHomePage({super.key});

  @override
  State<AppHomePage> createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  int _currentIndex = 0;

  static const _pages = <Widget>[
    HomeScreen(),
    CoursesScreen(),
    AchievementsScreen(),
    ProfileScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold(
      currentIndex: _currentIndex,
      onSelect: (index) => setState(() => _currentIndex = index),
      body: _pages[_currentIndex],
    );
  }
}

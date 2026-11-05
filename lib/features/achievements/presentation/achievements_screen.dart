import 'package:flutter/material.dart';

import '../../../core/localization/myanmar_text.dart';

class AchievementsScreen extends StatelessWidget {
  const AchievementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _AchievementsContent();
  }
}

class _AchievementsContent extends StatelessWidget {
  const _AchievementsContent();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.emoji_events_rounded,
              size: 56, color: Theme.of(context).colorScheme.primary),
          const SizedBox(height: 16),
          const Text(MyText.achievements),
          const SizedBox(height: 8),
          const Text(MyText.comingSoon, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

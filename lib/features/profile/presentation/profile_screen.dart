import 'package:flutter/material.dart';

import '../../../core/localization/myanmar_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 36,
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            child: Icon(Icons.person, color: Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(height: 16),
          const Text(MyText.profile),
          const SizedBox(height: 8),
          const Text(MyText.comingSoon, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

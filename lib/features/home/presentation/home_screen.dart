import 'package:flutter/material.dart';

import '../../../core/localization/myanmar_text.dart';
import '../../courses/presentation/courses_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ListView(
      children: [
        Text(MyText.welcome, style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 8),
        Text(MyText.learnToday, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 24),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.code_rounded, color: colorScheme.primary, size: 40),
                const SizedBox(height: 16),
                Text('Java', style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 8),
                const Text('Java ကို အခြေခံမှ စတင်လေ့လာပါ။'),
                const SizedBox(height: 20),
                FilledButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => const CoursesScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.play_arrow_rounded),
                  label: const Text(MyText.continueLearning),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

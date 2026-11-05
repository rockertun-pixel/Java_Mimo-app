import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/widgets/code_viewer.dart';
import '../../../core/widgets/sample_output_card.dart';
import '../../../data/models/lesson_model.dart';
import '../../quiz/presentation/quiz_screen.dart';
import '../providers/course_providers.dart';

class LessonDetailScreen extends ConsumerWidget {
  const LessonDetailScreen({required this.lesson, super.key});

  final LessonModel lesson;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = ref.watch(progressProvider);
    final completed = progress.isCompleted(lesson.id);

    return Scaffold(
      appBar: AppBar(title: Text('သင်ခန်းစာ ${lesson.order}')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(lesson.titleMyanmar, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 20),
          Text(lesson.explanationMyanmar, style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 24),
          CodeViewer(code: lesson.codeExample),
          const SizedBox(height: 16),
          SampleOutputCard(output: lesson.sampleOutput),
          const SizedBox(height: 28),
          FilledButton.icon(
            onPressed: completed
                ? null
                : () async {
                    await Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => QuizScreen(lesson: lesson),
                      ),
                    );
                  },
            icon: Icon(completed ? Icons.check : Icons.quiz),
            label: Text(completed ? 'ပြီးမြောက်ပြီးပါပြီ' : 'Quiz စတင်ရန်'),
          ),
        ],
      ),
    );
  }
}

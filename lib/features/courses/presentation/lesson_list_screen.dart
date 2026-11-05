import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/localization/myanmar_text.dart';
import '../../../data/models/course_model.dart';
import '../../../data/models/lesson_model.dart';
import '../providers/course_providers.dart';
import 'lesson_detail_screen.dart';

class LessonListScreen extends ConsumerWidget {
  const LessonListScreen({required this.course, super.key});

  final CourseModel course;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lessons = ref.watch(lessonsProvider(course.id));
    final progress = ref.watch(progressProvider);

    return Scaffold(
      appBar: AppBar(title: Text(course.languageName)),
      body: lessons.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('သင်ခန်းစာ ဖတ်မရပါ။\n$error')),
        data: (items) => _LessonList(
          course: course,
          lessons: items,
          progress: progress,
        ),
      ),
    );
  }
}

class _LessonList extends StatelessWidget {
  const _LessonList({
    required this.course,
    required this.lessons,
    required this.progress,
  });

  final CourseModel course;
  final List<LessonModel> lessons;
  final dynamic progress;

  @override
  Widget build(BuildContext context) {
    final orderedIds = lessons.map((lesson) => lesson.id).toList();
    final completedCount = lessons.where((lesson) => progress.isCompleted(lesson.id)).length;
    final progressValue = lessons.isEmpty ? 0.0 : completedCount / lessons.length;

    if (lessons.isEmpty) {
      return const Center(child: Text('ဤသင်တန်းအတွက် သင်ခန်းစာ မရှိသေးပါ။'));
    }

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text('${course.languageName} သင်ခန်းစာများ',
            style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 8),
        Text('$completedCount / ${lessons.length} ပြီးမြောက်ပြီး'),
        const SizedBox(height: 8),
        LinearProgressIndicator(value: progressValue),
        const SizedBox(height: 24),
        for (final lesson in lessons)
          _LessonTile(
            lesson: lesson,
            unlocked: progress.isUnlocked(
              lessonId: lesson.id,
              orderedLessonIds: orderedIds,
            ),
            completed: progress.isCompleted(lesson.id),
          ),
      ],
    );
  }
}

class _LessonTile extends ConsumerWidget {
  const _LessonTile({
    required this.lesson,
    required this.unlocked,
    required this.completed,
  });

  final LessonModel lesson;
  final bool unlocked;
  final bool completed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: completed
              ? colorScheme.primary
              : unlocked
                  ? colorScheme.primaryContainer
                  : colorScheme.surfaceContainerHighest,
          child: Icon(
            completed
                ? Icons.check
                : unlocked
                    ? Icons.play_arrow
                    : Icons.lock_outline,
            color: completed ? colorScheme.onPrimary : colorScheme.primary,
          ),
        ),
        title: Text('${lesson.order}. ${lesson.titleMyanmar}'),
        subtitle: Text(unlocked ? '${lesson.xpReward} XP' : 'ရှေ့သင်ခန်းစာကို အရင်ပြီးမြောက်ပါ'),
        onTap: unlocked
            ? () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => LessonDetailScreen(lesson: lesson),
                  ),
                );
              }
            : () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('ရှေ့သင်ခန်းစာကို အရင်ပြီးမြောက်ပါ။')),
                );
              },
      ),
    );
  }
}

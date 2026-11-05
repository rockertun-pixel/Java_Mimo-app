import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/localization/myanmar_text.dart';
import '../providers/course_providers.dart';
import 'lesson_list_screen.dart';

class CoursesScreen extends ConsumerWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courses = ref.watch(courseListProvider);

    return courses.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(
        child: Text('သင်တန်း data ဖတ်ရာတွင် အမှားရှိပါသည်။\n$error'),
      ),
      data: (items) => ListView(
        children: [
          Text(MyText.courses, style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 8),
          const Text('သင်ယူလိုသော programming language ကို ရွေးချယ်ပါ။'),
          const SizedBox(height: 24),
          for (final course in items)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Card(
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                    child: Text(course.languageName.substring(0, 1)),
                  ),
                  title: Text(course.languageName),
                  subtitle: Text('${course.subtitleMyanmar}\nအဆင့်: ${course.level}'),
                  isThreeLine: true,
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => LessonListScreen(course: course),
                      ),
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}

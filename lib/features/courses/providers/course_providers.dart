import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/datasources/local_course_data_source.dart';
import '../../../data/models/course_model.dart';
import '../../../data/models/lesson_model.dart';
import '../../../data/repositories/course_repository.dart';
import '../../../data/repositories/progress_repository.dart';
import '../../../data/models/user_progress_model.dart';

final courseRepositoryProvider = Provider<CourseRepository>((ref) {
  return LocalCourseRepository(LocalCourseDataSource());
});

final courseListProvider = FutureProvider<List<CourseModel>>((ref) {
  return ref.watch(courseRepositoryProvider).getCourses();
});

final lessonsProvider = FutureProvider.family<List<LessonModel>, String>((ref, courseId) {
  return ref.watch(courseRepositoryProvider).getLessons(courseId);
});

final progressRepositoryProvider = Provider<ProgressRepository>((ref) {
  return const LocalProgressRepository();
});

final progressProvider =
    NotifierProvider<ProgressController, UserProgressModel>(ProgressController.new);

class ProgressController extends Notifier<UserProgressModel> {
  @override
  UserProgressModel build() {
    _restore();
    return UserProgressModel.empty();
  }

  Future<void> completeLesson(LessonModel lesson) async {
    final updated = state.completeLesson(lesson.id, lesson.xpReward);
    if (updated == state) return;
    state = updated;
    await ref.read(progressRepositoryProvider).save(updated);
  }

  Future<void> _restore() async {
    final saved = await ref.read(progressRepositoryProvider).load();
    state = saved;
  }
}

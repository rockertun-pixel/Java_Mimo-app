import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/quiz_question_model.dart';
import '../../../data/repositories/quiz_repository.dart';

final quizRepositoryProvider = Provider<QuizRepository>((ref) {
  return const LocalQuizRepository();
});

final quizQuestionsProvider =
    FutureProvider.family<List<QuizQuestionModel>, String>((ref, lessonId) {
  return ref.watch(quizRepositoryProvider).getQuestions(lessonId);
});

import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/quiz_question_model.dart';

abstract interface class QuizRepository {
  Future<List<QuizQuestionModel>> getQuestions(String lessonId);
}

class LocalQuizRepository implements QuizRepository {
  const LocalQuizRepository();

  @override
  Future<List<QuizQuestionModel>> getQuestions(String lessonId) async {
    final raw = await rootBundle.loadString('assets/data/quizzes_java.json');
    final decoded = jsonDecode(raw) as List<dynamic>;
    return decoded
        .map((item) => QuizQuestionModel.fromJson(item as Map<String, dynamic>))
        .where((question) => question.lessonId == lessonId)
        .toList(growable: false);
  }
}

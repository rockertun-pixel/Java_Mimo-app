import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/course_model.dart';
import '../models/lesson_model.dart';

class LocalCourseDataSource {
  Future<List<CourseModel>> loadCourses() async {
    final raw = await rootBundle.loadString('assets/data/courses.json');
    final decoded = jsonDecode(raw) as List<dynamic>;
    return decoded
        .map((item) => CourseModel.fromJson(item as Map<String, dynamic>))
        .toList(growable: false);
  }

  Future<List<LessonModel>> loadLessons(String courseId) async {
    final path = 'assets/data/lessons_$courseId.json';
    try {
      final raw = await rootBundle.loadString(path);
      final decoded = jsonDecode(raw) as List<dynamic>;
      return decoded
          .map((item) => LessonModel.fromJson(item as Map<String, dynamic>))
          .where((lesson) => lesson.isPublished)
          .toList(growable: false);
    } on FlutterError {
      return const <LessonModel>[];
    }
  }
}

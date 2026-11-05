import '../datasources/local_course_data_source.dart';
import '../models/course_model.dart';
import '../models/lesson_model.dart';

abstract interface class CourseRepository {
  Future<List<CourseModel>> getCourses();
  Future<List<LessonModel>> getLessons(String courseId);
}

class LocalCourseRepository implements CourseRepository {
  const LocalCourseRepository(this._dataSource);

  final LocalCourseDataSource _dataSource;

  @override
  Future<List<CourseModel>> getCourses() => _dataSource.loadCourses();

  @override
  Future<List<LessonModel>> getLessons(String courseId) =>
      _dataSource.loadLessons(courseId);
}

class CourseModel {
  const CourseModel({
    required this.id,
    required this.languageName,
    required this.subtitleMyanmar,
    required this.level,
    required this.lessonIds,
  });

  final String id;
  final String languageName;
  final String subtitleMyanmar;
  final String level;
  final List<String> lessonIds;

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'] as String,
      languageName: json['languageName'] as String,
      subtitleMyanmar: json['subtitleMyanmar'] as String,
      level: json['level'] as String,
      lessonIds: List<String>.from(json['lessonIds'] as List<dynamic>),
    );
  }
}

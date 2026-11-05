class LessonModel {
  const LessonModel({
    required this.id,
    required this.courseId,
    required this.order,
    required this.titleMyanmar,
    required this.explanationMyanmar,
    required this.codeExample,
    required this.sampleOutput,
    required this.xpReward,
    required this.energyCost,
    required this.isPublished,
  });

  final String id;
  final String courseId;
  final int order;
  final String titleMyanmar;
  final String explanationMyanmar;
  final String codeExample;
  final String sampleOutput;
  final int xpReward;
  final int energyCost;
  final bool isPublished;

  factory LessonModel.fromJson(Map<String, dynamic> json) {
    return LessonModel(
      id: json['id'] as String,
      courseId: json['courseId'] as String,
      order: json['order'] as int,
      titleMyanmar: json['titleMyanmar'] as String,
      explanationMyanmar: json['explanationMyanmar'] as String,
      codeExample: json['codeExample'] as String,
      sampleOutput: json['sampleOutput'] as String,
      xpReward: json['xpReward'] as int,
      energyCost: json['energyCost'] as int,
      isPublished: json['isPublished'] as bool,
    );
  }
}

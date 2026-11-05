class QuizQuestionModel {
  const QuizQuestionModel({
    required this.id,
    required this.lessonId,
    required this.questionMyanmar,
    required this.options,
    required this.correctOptionIndex,
    required this.explanationMyanmar,
  });

  final String id;
  final String lessonId;
  final String questionMyanmar;
  final List<String> options;
  final int correctOptionIndex;
  final String explanationMyanmar;

  bool isCorrect(int selectedIndex) => selectedIndex == correctOptionIndex;

  factory QuizQuestionModel.fromJson(Map<String, dynamic> json) {
    return QuizQuestionModel(
      id: json['id'] as String,
      lessonId: json['lessonId'] as String,
      questionMyanmar: json['questionMyanmar'] as String,
      options: List<String>.from(json['options'] as List<dynamic>),
      correctOptionIndex: json['correctOptionIndex'] as int,
      explanationMyanmar: json['explanationMyanmar'] as String,
    );
  }
}

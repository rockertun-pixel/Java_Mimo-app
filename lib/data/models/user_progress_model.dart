import 'dart:convert';

class UserProgressModel {
  const UserProgressModel({
    required this.completedLessonIds,
    required this.totalXp,
  });

  final Set<String> completedLessonIds;
  final int totalXp;

  factory UserProgressModel.empty() => const UserProgressModel(
        completedLessonIds: <String>{},
        totalXp: 0,
      );

  bool isCompleted(String lessonId) => completedLessonIds.contains(lessonId);

  bool isUnlocked({required String lessonId, required List<String> orderedLessonIds}) {
    final index = orderedLessonIds.indexOf(lessonId);
    if (index <= 0) return index == 0;
    return completedLessonIds.contains(orderedLessonIds[index - 1]);
  }

  UserProgressModel completeLesson(String lessonId, int xpReward) {
    if (completedLessonIds.contains(lessonId)) return this;
    return UserProgressModel(
      completedLessonIds: {...completedLessonIds, lessonId},
      totalXp: totalXp + xpReward,
    );
  }

  Map<String, dynamic> toJson() => {
        'completedLessonIds': completedLessonIds.toList(),
        'totalXp': totalXp,
      };

  factory UserProgressModel.fromJson(Map<String, dynamic> json) {
    return UserProgressModel(
      completedLessonIds: Set<String>.from(
        (json['completedLessonIds'] as List<dynamic>? ?? <dynamic>[]),
      ),
      totalXp: json['totalXp'] as int? ?? 0,
    );
  }

  String encode() => jsonEncode(toJson());

  factory UserProgressModel.decode(String value) =>
      UserProgressModel.fromJson(jsonDecode(value) as Map<String, dynamic>);
}

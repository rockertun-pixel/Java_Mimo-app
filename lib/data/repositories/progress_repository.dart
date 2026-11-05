import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_progress_model.dart';

abstract interface class ProgressRepository {
  Future<UserProgressModel> load();
  Future<void> save(UserProgressModel progress);
}

class LocalProgressRepository implements ProgressRepository {
  const LocalProgressRepository();

  static const _key = 'user_progress';

  @override
  Future<UserProgressModel> load() async {
    final preferences = await SharedPreferences.getInstance();
    final saved = preferences.getString(_key);
    if (saved == null) return UserProgressModel.empty();
    return UserProgressModel.decode(saved);
  }

  @override
  Future<void> save(UserProgressModel progress) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(_key, progress.encode());
  }
}

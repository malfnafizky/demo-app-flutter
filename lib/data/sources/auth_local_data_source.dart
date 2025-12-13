import 'package:demo_app/core/storage/hive/user/user_model_storage.dart';
import 'package:hive/hive.dart';

abstract interface class AuthLocalDataSource {
  Future<void> uploadUser({
    required String key,
    required UserModelStorage user,
  });
  UserModelStorage loadUser({required String key});
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final Box box;
  AuthLocalDataSourceImpl(this.box);

  @override
  Future<void> uploadUser({
    required String key,
    required UserModelStorage user,
  }) async {
    await box.clear();
    await box.put(key, user);
  }

  @override
  UserModelStorage loadUser({required String key}) {
    return box.get(key);
  }
}

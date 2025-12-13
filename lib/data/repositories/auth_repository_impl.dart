import 'package:dartz/dartz.dart';
import 'package:demo_app/core/error/exceptions.dart';
import 'package:demo_app/core/error/failures.dart';
import 'package:demo_app/core/storage/hive/hive_storage.dart';
import 'package:demo_app/core/storage/hive/user/user_model_storage.dart';
import 'package:demo_app/core/storage/secure/secure_storage.dart';
import 'package:demo_app/data/models/user_model.dart';
import 'package:demo_app/data/sources/auth_api_service.dart';
import 'package:demo_app/domain/repositories/auth_repository.dart';
import 'package:demo_app/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthApiService _authApiService = sl<AuthApiService>();
  final HiveStorage<UserModelStorage> _userLocalStorage =
      sl<HiveStorage<UserModelStorage>>();

  @override
  Future<Either<Failure, UserModel>> signIn({
    required String username,
    required String password,
  }) async {
    try {
      final data = await _authApiService.signIn(
        username: username,
        password: password,
      );

      final accessToken = data['accessToken'] as String;
      final refreshToken = data['refreshToken'] as String;
      await SecureStorage.instance.saveAccessToken(accessToken);
      await SecureStorage.instance.saveAccessToken(refreshToken);

      final user = UserModel.fromJson(data['user']);
      final userStorageModel = UserModelStorage.fromJson(data['user']);
      await _userLocalStorage.saveItem('current-user', userStorageModel);

      return right(user);
    } on ServerException catch (e) {
      print('[SignIn - Failure] message : ${e.message}');
      return left(Failure(e.message));
    }
  }
}

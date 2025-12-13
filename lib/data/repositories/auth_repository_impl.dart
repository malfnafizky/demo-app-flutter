import 'package:dartz/dartz.dart';
import 'package:demo_app/core/error/exceptions.dart';
import 'package:demo_app/core/error/failures.dart';
import 'package:demo_app/core/storage/hive/user/user_model_storage.dart';
import 'package:demo_app/core/storage/secure/secure_storage.dart';
import 'package:demo_app/data/models/user_model.dart';
import 'package:demo_app/data/sources/auth_api_data_source.dart';
import 'package:demo_app/data/sources/auth_local_data_source.dart';
import 'package:demo_app/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthApiDataSource apiDataSource;
  final AuthLocalDataSource localDataSource;
  final SecureStorage secureStorage;

  AuthRepositoryImpl(
    this.apiDataSource,
    this.localDataSource,
    this.secureStorage,
  );

  @override
  Future<Either<Failure, UserModel>> signIn({
    required String username,
    required String password,
  }) async {
    try {
      final data = await apiDataSource.signIn(
        username: username,
        password: password,
      );

      await secureStorage.saveAccessToken(data['accessToken'] as String);
      await secureStorage.saveRefreshToken(data['refreshToken'] as String);

      final user = UserModel.fromJson(data);
      final userStorageModel = UserModelStorage.fromJson(data);
      await localDataSource.uploadUser(
        key: 'current-user',
        user: userStorageModel,
      );

      return right(user);
    } on ServerException catch (e) {
      print('[SignIn - Failure] message : ${e.message}');
      return left(Failure(e.message));
    }
  }

  @override
  Future<String?> getAccessToken() => secureStorage.getAccessToken();

  @override
  Future<Either<Failure, bool>> currentUser({
    required String accessToken,
  }) async {
    try {
      final result = await apiDataSource.currentUser(accessToken: accessToken);

      if (result.statusCode == 401 || result.data == null) {
        return right(false);
      }

      final userStorageModel = UserModelStorage.fromJson(result.data);
      await localDataSource.uploadUser(
        key: 'current-user',
        user: userStorageModel,
      );

      return right(true);
    } on ServerException catch (e) {
      print('[ValidateToken - Failure] message : ${e.message}');
      return left(Failure(e.message));
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:demo_app/core/error/failures.dart';
import 'package:demo_app/core/storage/hive/user/user_model_storage.dart';
import 'package:demo_app/data/auth/models/user_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserModel>> signIn({
    required String username,
    required String password,
  });

  Future<String?> getAccessToken();

  Future<Either<Failure, bool>> currentUser({required String accessToken});

  Future<UserModelStorage?> getLocalUser();
}

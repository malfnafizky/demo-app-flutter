import 'package:dartz/dartz.dart';
import 'package:demo_app/core/error/failures.dart';
import 'package:demo_app/data/models/user_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserModel>> signIn({
    required String username,
    required String password,
  });
}

import 'package:dartz/dartz.dart';
import 'package:demo_app/core/error/exceptions.dart';
import 'package:demo_app/core/error/failures.dart';
import 'package:demo_app/data/models/user_model.dart';
import 'package:demo_app/data/sources/auth_api_service.dart';
import 'package:demo_app/domain/repositories/auth_repository.dart';
import 'package:demo_app/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthApiService _authApiService = sl<AuthApiService>();

  @override
  Future<Either<Failure, UserModel>> signIn({
    required String username,
    required String password,
  }) async {
    try {
      final user = await _authApiService.signIn(
        username: username,
        password: password,
      );

      print('[SignIn - Success] id : ${user.id}');
      print('[SignIn - Success] username : ${user.username}');
      print('[SignIn - Success] email : ${user.email}');
      print('[SignIn - Success] firstName : ${user.firstName}');
      print('[SignIn - Success] lastName : ${user.lastName}');
      print('[SignIn - Success] gender : ${user.gender}');
      print('[SignIn - Success] image : ${user.image}');
      print('[SignIn - Success] accessToken : ${user.accessToken}');
      print('[SignIn - Success] refreshToken : ${user.refreshToken}');

      return right(user);
    } on ServerException catch (e) {
      print('[SignIn - Failure] message : ${e.message}');
      return left(Failure(e.message));
    }
  }
}

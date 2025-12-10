import 'package:dartz/dartz.dart';
import 'package:demo_app/core/error/failures.dart';
import 'package:demo_app/core/usecase/usecase.dart';
import 'package:demo_app/domain/entities/User.dart';
import 'package:demo_app/domain/repositories/auth_repository.dart';
import 'package:demo_app/service_locator.dart';

class UserSignInUseCase implements UseCase<User, Map<String, dynamic>> {
  final AuthRepository _authRepository = sl<AuthRepository>();

  @override
  Future<Either<Failure, User>> call(Map<String, dynamic> params) async {
    return await _authRepository.signIn(
      username: params['username'] ?? '',
      password: params['password'] ?? '',
    );
  }
}

class UserSignInParams {
  final String username;
  final String password;

  UserSignInParams({required this.username, required this.password});
}

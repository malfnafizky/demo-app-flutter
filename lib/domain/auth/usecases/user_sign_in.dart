import 'package:dartz/dartz.dart';
import 'package:demo_app/core/error/failures.dart';
import 'package:demo_app/core/usecase/usecase.dart';
import 'package:demo_app/domain/auth/entities/user.dart';
import 'package:demo_app/domain/auth/repositories/auth_repository.dart';

class UserSignInUseCase implements UseCase<User, UserSignInParams> {
  final AuthRepository authRepository;
  UserSignInUseCase(this.authRepository);

  @override
  Future<Either<Failure, User>> call(UserSignInParams params) async {
    return await authRepository.signIn(
      username: params.username,
      password: params.password,
    );
  }
}

class UserSignInParams {
  final String username;
  final String password;

  UserSignInParams({required this.username, required this.password});
}

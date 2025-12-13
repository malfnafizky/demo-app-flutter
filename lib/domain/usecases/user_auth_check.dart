import 'package:dartz/dartz.dart';
import 'package:demo_app/core/error/failures.dart';
import 'package:demo_app/core/usecase/usecase.dart';
import 'package:demo_app/domain/repositories/auth_repository.dart';

class UserAuthCheckUseCase implements UseCase<bool, NoParams> {
  final AuthRepository authRepository;
  UserAuthCheckUseCase(this.authRepository);
  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    final accessToken = await authRepository.getAccessToken();
    if (accessToken != null) {
      return await authRepository.currentUser(accessToken: accessToken);
    }
    return right(false);
  }
}

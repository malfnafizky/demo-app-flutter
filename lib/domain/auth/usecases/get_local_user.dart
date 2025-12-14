import 'package:demo_app/data/auth/models/user_model.dart';
import 'package:demo_app/domain/auth/entities/user.dart';
import 'package:demo_app/domain/auth/repositories/auth_repository.dart';

class GetLocalUserUseCase {
  final AuthRepository authRepository;
  GetLocalUserUseCase(this.authRepository);

  Future<User?> execute() async {
    final result = await authRepository.getLocalUser();
    if (result != null) {
      return UserModel.fromJson(result.toJson());
    }
    return null;
  }
}

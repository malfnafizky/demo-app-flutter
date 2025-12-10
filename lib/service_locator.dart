import 'package:demo_app/core/network/dio_client.dart';
import 'package:demo_app/data/repositories/auth_repository_impl.dart';
import 'package:demo_app/data/sources/auth_api_service.dart';
import 'package:demo_app/domain/repositories/auth_repository.dart';
import 'package:demo_app/domain/usecases/user_sign_in.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  // ApiServices
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());

  // Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  // UseCases
  sl.registerSingleton<UserSignInUseCase>(UserSignInUseCase());
}

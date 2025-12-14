import 'package:demo_app/core/constans/box_names.dart';
import 'package:demo_app/core/network/dio_client.dart';
import 'package:demo_app/core/storage/hive/user/user_model_storage.dart';
import 'package:demo_app/core/storage/secure/secure_storage.dart';
import 'package:demo_app/data/auth/repositories/auth_repository_impl.dart';
import 'package:demo_app/data/auth/sources/auth_api_data_source.dart';
import 'package:demo_app/data/auth/sources/auth_local_data_source.dart';
import 'package:demo_app/domain/auth/repositories/auth_repository.dart';
import 'package:demo_app/domain/auth/usecases/get_local_user.dart';
import 'package:demo_app/domain/auth/usecases/user_auth_check.dart';
import 'package:demo_app/domain/auth/usecases/user_sign_in.dart';
import 'package:demo_app/presentation/bloc/auth/auth_bloc.dart';
import 'package:demo_app/routes/app_router.dart';
import 'package:demo_app/routes/auth_guard.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();

  await Hive.initFlutter();
  Hive.registerAdapter(UserModelStorageAdapter());

  final userBox = await Hive.openBox(BoxNames.userBox);

  serviceLocator.registerLazySingleton(() => userBox, instanceName: 'UserBox');

  serviceLocator.registerLazySingleton(() => DioClient());

  serviceLocator.registerLazySingleton(() => SecureStorage.instance);

  serviceLocator.registerLazySingleton<AuthGuard>(
    () => AuthGuard(serviceLocator<AuthBloc>()),
  );

  serviceLocator.registerLazySingleton<AppRouter>(
    () => AppRouter(serviceLocator<AuthGuard>()),
  );
}

void _initAuth() {
  serviceLocator
    // DataSources
    ..registerFactory<AuthApiDataSource>(
      () => AuthApiDataSourceImpl(serviceLocator()),
    )
    ..registerFactory<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(serviceLocator(instanceName: 'UserBox')),
    )
    // Repository
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
      ),
    )
    // UseCases
    ..registerFactory(() => UserAuthCheckUseCase(serviceLocator()))
    ..registerFactory(() => UserSignInUseCase(serviceLocator()))
    ..registerFactory(() => GetLocalUserUseCase(serviceLocator()))
    // Bloc
    ..registerLazySingleton(
      () => AuthBloc(
        signInUseCase: serviceLocator(),
        authCheckUseCase: serviceLocator(),
      ),
    );
}

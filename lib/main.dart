import 'package:demo_app/core/configs/theme.dart';
import 'package:demo_app/init_dependencies.dart';
import 'package:demo_app/presentation/bloc/auth/auth_bloc.dart';
import 'package:demo_app/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => serviceLocator<AuthBloc>()..add(AuthIsUserSignIn()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Demo App',
      theme: AppTheme.lightThemeMode,
      debugShowCheckedModeBanner: false,
      routerConfig: serviceLocator<AppRouter>().config(),
    );
  }
}

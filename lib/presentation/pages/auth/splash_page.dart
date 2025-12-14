import 'package:auto_route/auto_route.dart';
import 'package:demo_app/domain/auth/usecases/get_local_user.dart';
import 'package:demo_app/presentation/bloc/auth/auth_bloc.dart';
import 'package:demo_app/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage(name: 'SplashRoute')
class SplashPage extends StatelessWidget {
  final GetLocalUserUseCase getLocalUserUseCase;

  const SplashPage({super.key, required this.getLocalUserUseCase});

  Future<void> _handleAuthSuccess(BuildContext context) async {
    // tunggu animasi splash
    await Future.delayed(const Duration(seconds: 2));

    if (!context.mounted) return;

    // ambil user lokal
    final user = await getLocalUserUseCase.execute();

    if (user != null) {
      context.router.replace(MainRoute(user: user));
    } else {
      context.router.replace(const SignInRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess<bool> && state.result) {
          _handleAuthSuccess(context);
        } else if (state is AuthFailure) {
          // jika gagal auth, langsung ke SignIn
          context.router.replace(const SignInRoute());
        }
      },
      child: const Scaffold(
        body: Center(
          child: Text('Splash Screen', style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}

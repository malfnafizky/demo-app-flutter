import 'package:auto_route/auto_route.dart';
import 'package:demo_app/presentation/bloc/auth/auth_bloc.dart';
import 'package:demo_app/routes/app_router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  final AuthBloc authBloc;
  AuthGuard(this.authBloc);
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final state = authBloc.state;

    if (state is AuthSuccess<bool> && state.result) {
      resolver.next(true);
    } else {
      router.replace(const SignInRoute());
    }
  }
}

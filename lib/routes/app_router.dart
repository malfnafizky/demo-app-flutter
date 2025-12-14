import 'package:auto_route/auto_route.dart';
import 'package:demo_app/routes/app_router.gr.dart';
import 'package:demo_app/routes/auth_guard.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  final AuthGuard authGuard;
  AppRouter(this.authGuard);

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: SignInRoute.page),
    AutoRoute(page: SignUpRoute.page),
    AutoRoute(page: MainRoute.page),
    // AutoRoute(page: MainRoute.page, guards: [authGuard]),
  ];
}

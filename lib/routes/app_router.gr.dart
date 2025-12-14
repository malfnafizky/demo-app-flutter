// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:demo_app/domain/auth/entities/user.dart' as _i7;
import 'package:demo_app/presentation/pages/auth/signin_page.dart' as _i3;
import 'package:demo_app/presentation/pages/auth/signup_page.dart' as _i2;
import 'package:demo_app/presentation/pages/auth/splash_page.dart' as _i4;
import 'package:demo_app/presentation/pages/main_page.dart' as _i1;
import 'package:flutter/material.dart' as _i6;

/// generated route for
/// [_i1.MainPage]
class MainRoute extends _i5.PageRouteInfo<MainRouteArgs> {
  MainRoute({
    _i6.Key? key,
    required _i7.User user,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          MainRoute.name,
          args: MainRouteArgs(
            key: key,
            user: user,
          ),
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MainRouteArgs>();
      return _i1.MainPage(
        key: args.key,
        user: args.user,
      );
    },
  );
}

class MainRouteArgs {
  const MainRouteArgs({
    this.key,
    required this.user,
  });

  final _i6.Key? key;

  final _i7.User user;

  @override
  String toString() {
    return 'MainRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i2.SignUpPage]
class SignUpRoute extends _i5.PageRouteInfo<void> {
  const SignUpRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.SignUpPage();
    },
  );
}

/// generated route for
/// [_i3.SigninPage]
class SignInRoute extends _i5.PageRouteInfo<void> {
  const SignInRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.SigninPage();
    },
  );
}

/// generated route for
/// [_i4.SplashPage]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.SplashPage();
    },
  );
}

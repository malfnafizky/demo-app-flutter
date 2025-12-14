import 'package:demo_app/core/usecase/usecase.dart';
import 'package:demo_app/domain/auth/entities/user.dart';
import 'package:demo_app/domain/auth/usecases/user_auth_check.dart';
import 'package:demo_app/domain/auth/usecases/user_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignInUseCase _signInUseCase;
  final UserAuthCheckUseCase _authCheckUseCase;
  AuthBloc({
    required UserSignInUseCase signInUseCase,
    required UserAuthCheckUseCase authCheckUseCase,
  }) : _signInUseCase = signInUseCase,
       _authCheckUseCase = authCheckUseCase,
       super(AuthInitial()) {
    on<AuthEvent>((_, emit) => AuthLoading());
    on<AuthIsUserSignIn>(_authCheck);
    on<AuthSignIn>(_authSignIn);
  }

  void _authCheck(AuthIsUserSignIn event, Emitter<AuthState> emit) async {
    final res = await _authCheckUseCase(NoParams());

    res.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (isSignIn) => emit(AuthSuccess<bool>(isSignIn)),
    );
  }

  void _authSignIn(AuthSignIn event, Emitter<AuthState> emit) async {
    final res = await _signInUseCase(
      UserSignInParams(username: event.username, password: event.password),
    );

    res.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) => emit(AuthSuccess<User>(user)),
    );
  }
}

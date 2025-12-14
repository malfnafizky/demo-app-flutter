import 'package:auto_route/auto_route.dart';
import 'package:demo_app/core/configs/app_color.dart';
import 'package:demo_app/domain/auth/entities/user.dart';
import 'package:demo_app/presentation/bloc/auth/auth_bloc.dart';
import 'package:demo_app/routes/app_router.gr.dart';
import 'package:demo_app/widgets/default_button.dart';
import 'package:demo_app/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage(name: 'SignInRoute')
class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onSignIn() {
    if (!_formKey.currentState!.validate()) return;
    print(
      '[SignInPage - _onSignIn()] \n username : ${_usernameController.text.trim()} \n password : ${_passwordController.text.trim()}',
    );
    context.read<AuthBloc>().add(
      AuthSignIn(
        username: _usernameController.text.trim(),
        password: _passwordController.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          print('[SignInPage - AuthFailure] message : ${state.message}');
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }

        if (state is AuthSuccess<User>) {
          print(
            '[SignInPage - AuthSuccess<User>] message : ${state.result.firstName}',
          );
          context.replaceRoute(MainRoute(user: state.result));
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            final isLoading = state is AuthLoading;
            print('[SignInPage - BlocBuilder] is loading : ${isLoading}');
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.person,
                          size: 80,
                          color: AppPallete.greyColor,
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          'Welcome back to NameApp',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Kelola stok produk anda dengan mudah tanpa takut kehilangan data.',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppPallete.greyColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 32),

                        // Username Field
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Username',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppPallete.greyColor,
                              ),
                            ),
                            const SizedBox(height: 8),
                            InputField(
                              hintText: 'Enter username',
                              controller: _usernameController,
                              validator: (value) =>
                                  value == null || value.isEmpty
                                  ? 'Username wajib diisi'
                                  : null,
                            ),
                            const SizedBox(height: 16),

                            // Password Field
                            const Text(
                              'Password',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppPallete.greyColor,
                              ),
                            ),
                            const SizedBox(height: 8),
                            InputField(
                              hintText: 'Enter password',
                              controller: _passwordController,
                              isObsecureText: true,
                              validator: (value) =>
                                  value == null || value.isEmpty
                                  ? 'Password wajib diisi'
                                  : null,
                            ),
                            const SizedBox(height: 32),

                            // Sign In Button
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: DefaultButton(
                                buttonText: 'Sign In',
                                isLoading: isLoading,
                                onPressed: _onSignIn,
                              ),
                            ),
                            const SizedBox(height: 16),

                            // Forgot Password
                            Align(
                              alignment: Alignment.center,
                              child: TextButton(
                                onPressed: () {
                                  // TODO: implement forgot password
                                },
                                child: const Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),

        // Bottom Sign Up Prompt
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don't have an account? ",
                style: TextStyle(fontSize: 16, color: AppPallete.greyColor),
              ),
              TextButton(
                onPressed: () {
                  context.pushRoute(const SignUpRoute());
                },
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                child: const Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

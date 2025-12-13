import 'package:auto_route/auto_route.dart';
import 'package:demo_app/core/configs/app_color.dart';
import 'package:demo_app/routes/app_router.gr.dart';
import 'package:demo_app/widgets/default_button.dart';
import 'package:demo_app/widgets/input_field.dart';
import 'package:flutter/material.dart';

@RoutePage(name: 'SignInRoute')
class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.person, size: 60, color: AppPallete.greyColor),
                const SizedBox(height: 24),
                const Text(
                  'Welcome back to NameApp',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Kelola stok produk anda dengan mudah tanpa takut kehilangan data.',
                  style: TextStyle(fontSize: 16, color: AppPallete.greyColor),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
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
                    ),
                    const SizedBox(height: 14),
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
                    ),
                    const SizedBox(height: 24),
                    DefaultButton(
                      buttonText: 'Sign In',
                      onPressed: () {
                        // context.router.replacePath('/main-page');
                        final Map<String, dynamic> _userSignInParams = {
                          'username': _usernameController.text.trim(),
                          'password': _passwordController.text.trim(),
                        };
                        // sl<UserSignInUseCase>().call(_userSignInParams);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 26),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have an account? ",
              style: TextStyle(fontSize: 16, color: AppPallete.greyColor),
            ),
            TextButton(
              onPressed: () {
                context.pushRoute(const SignUpRoute());
              },
              style: ButtonStyle(
                padding: WidgetStateProperty.all(EdgeInsets.zero),
              ),
              child: Text(
                "Sign Up",
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

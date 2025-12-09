import 'package:demo_app/core/app_color.dart';
import 'package:demo_app/widgets/default_button.dart';
import 'package:demo_app/widgets/input_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
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
                      'Email',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppPallete.greyColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    InputField(hintText: 'Email', controller: _emailController),
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
                      hintText: 'Password',
                      controller: _passwordController,
                      isObsecureText: true,
                    ),
                    const SizedBox(height: 24),
                    DefaultButton(buttonText: 'Sign In', onPressed: () {}),
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
              onPressed: () {},
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

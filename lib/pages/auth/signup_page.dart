import 'package:auto_route/auto_route.dart';
import 'package:demo_app/core/configs/app_color.dart';
import 'package:demo_app/widgets/default_button.dart';
import 'package:demo_app/widgets/input_field.dart';
import 'package:flutter/material.dart';

@RoutePage(name: 'SignUpRoute')
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
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
                const Icon(Icons.lock, size: 60, color: AppPallete.greyColor),
                const SizedBox(height: 24),
                const Text(
                  'Get Started with NameApp',
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
                      hintText: 'Username',
                      controller: _usernameController,
                    ),
                    const SizedBox(height: 14),
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
                    DefaultButton(
                      buttonText: 'Sign Up',
                      onPressed: () {
                        // context.router.replacePath('/main-page');
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 26),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppPallete.greyColor,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      style: ButtonStyle(
                        padding: WidgetStateProperty.all(EdgeInsets.zero),
                      ),
                      child: Text(
                        "Log In",
                        style: TextStyle(fontSize: 16, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.only(bottom: 40),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text(
      //         "Don't have an account? ",
      //         style: TextStyle(fontSize: 16, color: AppPallete.greyColor),
      //       ),
      //       TextButton(
      //         onPressed: () {},
      //         style: ButtonStyle(
      //           padding: WidgetStateProperty.all(EdgeInsets.zero),
      //         ),
      //         child: Text(
      //           "Sign Up",
      //           style: TextStyle(fontSize: 16, color: Colors.blue),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

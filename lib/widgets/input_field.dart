import 'package:demo_app/core/configs/app_color.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool isObsecureText;

  const InputField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.validator,
    this.isObsecureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: AppPallete.borderColor),
      ),
      validator: validator,
      obscureText: isObsecureText,
    );
  }
}

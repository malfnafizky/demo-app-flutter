import 'package:demo_app/core/configs/app_color.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const DefaultButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(400, 50),
        backgroundColor: AppPallete.primaryColor,
        shadowColor: Colors.transparent,
      ),
    );
  }
}

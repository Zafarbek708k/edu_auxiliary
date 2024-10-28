import 'package:edu_auxiliary/src/core/constants/all_library.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TermsOfUseWidget extends StatelessWidget {
  const TermsOfUseWidget({super.key, required this.onPressed, required this.onTap});

  final VoidCallback onPressed;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 14.0,
          ),
          children: [
            const TextSpan(text: "By signing up, you accept Edu Auxiliary "),
            TextSpan(
                text: "Terms of Service",
                style: const TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()..onTap = () => onPressed),
            const TextSpan(text: ", "),
            TextSpan(
                text: "Privacy Policy",
                style: const TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()..onTap = () => onTap),
            const TextSpan(text: ", and agree to receive emails from  Edu Auxiliary."),
          ],
        ),
      ),
    );
  }
}
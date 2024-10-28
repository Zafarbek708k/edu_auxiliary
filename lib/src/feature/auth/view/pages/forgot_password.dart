import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:edu_auxiliary/src/core/constants/context_extension.dart';

import '../../../../core/widgets/text_widget.dart';
import '../widgets/auth_main_button.dart';
import '../widgets/auth_main_textfield.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailCtr = TextEditingController();
  bool state = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.primary,
      appBar: AppBar(
        backgroundColor: context.appTheme.primary,
        centerTitle: true,
        title: CustomTextWidget("Reset Password", textColor: context.appTheme.secondary, fontWeight: FontWeight.bold, fontSize: 16),
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back_ios, size: 18)),
        iconTheme: IconThemeData(color: context.appTheme.secondary),
        bottom: PreferredSize(preferredSize: const Size(double.infinity, 2), child: Divider(color: context.appTheme.secondary)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: state
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  CustomTextWidget("Enter your email address. we'll send you a link to reset your password",
                      textColor: context.appTheme.secondary, fontWeight: FontWeight.w400, fontSize: 14),
                  const SizedBox(height: 25),
                  CustomTextWidget(
                    "Email address",
                    textColor: Colors.grey.shade200,
                    fontSize: 14,
                  ),
                  AuthMainTextField(controller: emailCtr, hintText: ""),
                  const SizedBox(height: 30),
                  AuthMainButton(
                    onPressed: () {
                      setState(() {
                        state = false;
                      });
                    },
                    title: "Continue",
                    backgroundColor: Colors.green,
                  ),
                  const SizedBox(height: 20),
                  const Spacer(),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  CustomTextWidget("Great! Check your inbox for a Kwork email.",
                      textColor: context.appTheme.secondary, fontWeight: FontWeight.w600, fontSize: 16),
                  const SizedBox(height: 25),
                  CustomTextWidget(
                      "The email will help you get back into your account. if you didn't receive an email, make sure to check your "
                      "spam and trash folders",
                      textColor: context.appTheme.secondary,
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                  const SizedBox(height: 50),
                  AuthMainButton(
                    onPressed: () {
                      context.pop();
                    },
                    title: "Finish",
                    backgroundColor: Colors.green,
                  ),
                  const SizedBox(height: 20),
                  const Spacer(),
                ],
              ),
      ),
    );
  }
}

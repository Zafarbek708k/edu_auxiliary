import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:edu_auxiliary/src/core/constants/context_extension.dart';
import 'package:edu_auxiliary/src/core/routes/app_route_name.dart';
import 'package:edu_auxiliary/src/core/widgets/text_widget.dart';

import '../../../../core/storage/sheared_preferens.dart';
import '../widgets/auth_main_button.dart';
import '../widgets/auth_main_textfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool visible = false;
  TextEditingController ctrEmail = TextEditingController();
  TextEditingController ctrPassword = TextEditingController();
  String title = "";

  @override
  void dispose() {
    ctrEmail.dispose();
    ctrPassword.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() async {
    await findRule();
    super.didChangeDependencies();
  }

  Future<void> findRule() async {
    String? result = await StorageService.loadData(key: SharedPrefKey.student);
    if (result != null) {
      title = result;
      setState(() {});
    } else {
      String? result2 = await StorageService.loadData(key: SharedPrefKey.teacher);
      if (result2 != null) {
        title = result2;
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.primary,
      appBar: AppBar(
        backgroundColor: context.appTheme.primary,
        centerTitle: true,
        title: CustomTextWidget("Login as a $title", textColor: context.appTheme.secondary, fontWeight: FontWeight.bold, fontSize: 16),
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back_ios, size: 18)),
        iconTheme: IconThemeData(color: context.appTheme.secondary),
        bottom: PreferredSize(preferredSize: const Size(double.infinity, 2), child: Divider(color: context.appTheme.secondary)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Spacer(flex: 1),
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: context.appTheme.primary, width: 1),
                image: const DecorationImage(image: AssetImage("assets/images/edu_helper_logo.png")),
              ),
            ),
            const Spacer(flex: 1),
            CustomTextWidget("Welcome back!", textColor: context.appTheme.secondary, fontWeight: FontWeight.w600, fontSize: 18),
            const SizedBox(height: 5),
            CustomTextWidget("Please enter your login info.", textColor: context.appTheme.secondary, fontWeight: FontWeight.w400, fontSize: 14),
            const Spacer(flex: 1),
            AuthMainTextField(controller: ctrEmail, hintText: "Email"),
            const Spacer(flex: 1),
            AuthMainTextField(controller: ctrPassword, hintText: "Password", isPassword: true),
            const Spacer(flex: 1),
            AuthMainButton(
              onPressed: () => (title == "teacher") ? context.go(AppRouteName.teacher) : context.push(AppRouteName.home),
              title: "Login",
              backgroundColor: Colors.green,
            ),
            const Spacer(flex: 1),
            TextButton(
              onPressed: () => context.go("${AppRouteName.login}/${AppRouteName.forgetPassword}"),
              child: const CustomTextWidget("Forgot your password?", textColor: Colors.blue, fontWeight: FontWeight.w500, fontSize: 14),
            ),
            const Spacer(flex: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => context.go("${AppRouteName.login}/${AppRouteName.register}"),
                  child: const CustomTextWidget("New to Edu Auxiliary? Join now", textColor: Colors.blue, fontWeight: FontWeight.w500, fontSize: 14),
                ),
              ],
            ),
            const Spacer(flex: 1)
          ],
        ),
      ),
    );
  }
}

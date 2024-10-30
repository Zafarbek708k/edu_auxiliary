import 'dart:developer';

import 'package:edu_auxiliary/src/core/constants/all_library.dart';

import '../../../widgets/main_button_widget.dart';

class TeacherProfile extends StatefulWidget {
  const TeacherProfile({super.key});

  @override
  State<TeacherProfile> createState() => _TeacherProfileState();
}

class _TeacherProfileState extends State<TeacherProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding:  REdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextWidget("Name: "),
              CustomTextWidget("Last Name: "),
              CustomTextWidget("Phone Number: "),
              MainButton(
                onPressed: () async {
                  await AuthService.deleteAccount().then((value) {
                    log("go splash");
                    context.go(AppRouteName.splash);
                  });
                },
                title: "Deleted account",
                txtColor: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

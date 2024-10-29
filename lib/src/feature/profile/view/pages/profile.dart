import 'package:edu_auxiliary/src/core/constants/all_library.dart';
import 'package:edu_auxiliary/src/feature/profile/view/widgets/profile_button.dart';
import 'package:edu_auxiliary/src/feature/widgets/main_button_widget.dart';
import 'package:flutter/cupertino.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.primary,
      appBar: AppBar(
        backgroundColor: context.appTheme.primary,
        centerTitle: true,
        title: CustomTextWidget("Profile", textColor: context.appTheme.secondary, fontWeight: FontWeight.bold, fontSize: 16),
        iconTheme: IconThemeData(color: context.appTheme.secondary),
        bottom: PreferredSize(preferredSize: const Size(double.infinity, 2), child: Divider(color: context.appTheme.secondary)),
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
        child: ListView(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50.r),
              child: Container(
                height: 125,
                width: 75,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: context.appTheme.secondary),
                  image: const DecorationImage(image: AssetImage("assets/images/edu_helper_logo.png")),
                ),
              ),
            ),
            MainButton(
              onPressed: () {},
              rightIcon: Icon(Icons.edit, color: context.appTheme.secondary),
              title: "Change Image",
              width: 100,
              verticalPadding: 10,
            ),
            CustomTextWidget("Full Name: ", textColor: context.appTheme.secondary),
            CustomTextWidget("Attendance ", textColor: context.appTheme.secondary),
            MainButton(
              onPressed: () async {
                await AuthService.deleteAccount().then((value){
                  context.go(AppRouteName.splash);
                });
              },
              title: "Deleted account",
              txtColor: Colors.red,
            ),
            const SizedBox(height: 200),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: context.appTheme.secondary, width: 1),
              ),
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ProfileButton(
                        bottomLine: true,
                        topLine: false,
                        title: "Language",
                        onTap: () {},
                        rightWidget: Icon(Icons.arrow_forward_ios, color: context.appTheme.secondary),
                      ),
                      ProfileButton(
                        bottomLine: true,
                        topLine: false,
                        title: "Theme",
                        onTap: () {},
                        rightWidget: CupertinoSwitch(value: true, onChanged: (value) {}),
                      ),
                      ProfileButton(bottomLine: false, topLine: false, title: "Deleted Account", textColor: Colors.red, onTap: () {}),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            CustomTextWidget("Application Version: ", textColor: context.appTheme.secondary),
          ],
        ),
      ),
    );
  }
}

import 'package:edu_auxiliary/src/core/constants/all_library.dart';
import 'package:flutter/cupertino.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name = "";
  bool theme = false;

  @override
  void didChangeDependencies() async {
    await readName();
    super.didChangeDependencies();
  }

  Future<void> readName() async {
    String? result = await StorageService.loadData(key: SharedPrefKey.fullName);
    if (result != null) setState(() => name = result);
  }

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
            CustomTextWidget("Full Name: $name", textColor: context.appTheme.secondary),
            CustomTextWidget("\nAttendance\n", textColor: context.appTheme.secondary),
            DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: context.appTheme.secondary, width: 1)
              ),
              child: TableCalendar(
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: DateTime.now(),
              ),
            ),
            SizedBox(height: 10.h),

            CustomTextWidget("\n Setting",fontWeight: FontWeight.bold,fontSize: 20, textColor: context.appTheme.secondary),
            SizedBox(height: 5.h),
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
                        rightWidget: CupertinoSwitch(
                            value: theme,
                            onChanged: (value) {
                              themeController.switchTheme();
                              setState(() => theme = value);
                            }),
                      ),
                      ProfileButton(
                        bottomLine: false,
                        topLine: false,
                        title: "Deleted Account",
                        textColor: Colors.red,
                        onTap: () async {
                          await AuthService.deleteAccount().then((value) {
                            context.go(AppRouteName.splash);
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            CustomTextWidget("Application Version: 1.0.0", textColor: context.appTheme.secondary),
          ],
        ),
      ),
    );
  }
}

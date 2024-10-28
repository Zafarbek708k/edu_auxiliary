import 'dart:developer';

import 'package:edu_auxiliary/src/core/constants/all_library.dart';
import 'package:edu_auxiliary/src/core/storage/sheared_preferens.dart';

import '../../../widgets/main_button_widget.dart';

class SelectRule extends StatefulWidget {
  const SelectRule({super.key});

  @override
  State<SelectRule> createState() => _SelectRuleState();
}

class _SelectRuleState extends State<SelectRule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.primary,
      body: DecoratedBox(
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/select_page_bcg.png"), fit: BoxFit.cover)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 200),
            child: BlurWidget(
              blur: 5,
              radius: 15,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), border: Border.all(color: context.appTheme.secondary, width: 1)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Spacer(flex: 1),
                      const CustomTextWidget("Who are you?", textColor: Colors.white, fontWeight: FontWeight.bold),
                      const Spacer(flex: 2),
                      MainButton(
                        onPressed: () async {
                          await StorageService.storeData(key: SharedPrefKey.teacher, value: "teacher").then(
                            (value) async {
                              await StorageService.removeData(key: SharedPrefKey.student).then((value) {
                                context.push(AppRouteName.login);
                              });
                            },
                          );
                        },
                        title: "Teacher",
                        txtColor: Colors.white,
                      ),
                      const SizedBox(height: 10),
                      MainButton(
                        onPressed: () async {
                          await StorageService.storeData(key: SharedPrefKey.student, value: "student").then(
                            (value) async {
                              await StorageService.removeData(key: SharedPrefKey.teacher).then((value) {
                                context.push(AppRouteName.login);
                              });
                            },
                          );
                        },
                        title: "Student",
                        txtColor: Colors.white,
                      ),
                      const SizedBox(height: 10),
                      MainButton(
                        onPressed: () async {
                          await StorageService.removeData(key: SharedPrefKey.student).then((value) async {
                            await StorageService.removeData(key: SharedPrefKey.student);
                            String? result = await StorageService.loadData(key: SharedPrefKey.student);
                            log("stored data = $result");
                          });
                        },
                        title: "Delete data",
                        txtColor: Colors.white,
                      ),
                      const Spacer(flex: 2)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

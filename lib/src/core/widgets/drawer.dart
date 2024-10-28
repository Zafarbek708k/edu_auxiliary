import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:edu_auxiliary/src/core/constants/context_extension.dart';
import 'package:edu_auxiliary/src/core/widgets/text_widget.dart';

import '../storage/app_storage.dart';
import 'app_material_context.dart';
import 'custom_lang_button.dart';

class CustomMainDrawer extends StatelessWidget {
  const CustomMainDrawer({super.key});

  final MethodChannel channel = const MethodChannel("urlLaunching");

  // Method to open a URL in the browser
  Future<void> openUrlInBrowser(String url) async {
    try {
      final result = await channel.invokeMethod('openUrlInBrowser', {'url': url});
      log(result); // Handle success (URL_OPENED)
    } on PlatformException catch (e) {
      log("Failed to open URL: ${e.message}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: context.appTheme.primary,
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 8, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LangButton(),
            MaterialButton(
              onPressed: () async {
                themeController.switchTheme(); // Using the shared instance
              },
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(color: Theme.of(context).colorScheme.secondary)),
              child: Text(
                context.localized.switchTheme,
                style: TextStyle(color: Theme.of(context).colorScheme.secondary),
              ),
            ),
            const SizedBox(height: 20),
            MaterialButton(
              onPressed: () async {
                AppStorage.$delete(key: StorageKey.enter);
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9), side: BorderSide(color: Theme.of(context).colorScheme.secondary)),
              child: Text(
                "Delete User",
                style: TextStyle(color: Theme.of(context).colorScheme.secondary),
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () async => await openUrlInBrowser("https://github.com/Zafarbek708k"),
              child: const CustomTextWidget("GitHub", textColor: Colors.blue),
            ),
            const Divider(),
            InkWell(
              onTap: () async => await openUrlInBrowser("https://www.linkedin.com/in/zafarbek-karimov"),
              child: const CustomTextWidget("LinkedIn", textColor: Colors.blue),
            ),
            const Divider(),
            const CustomTextWidget("Created by Zafarbek Karimov", textColor: Colors.blue),
            const SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/all_library.dart';
import '../widgets/home_banner_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.primary,
      appBar: AppBar(
        backgroundColor: context.appTheme.primary,
        centerTitle: true,
        title: CustomTextWidget("Home", textColor: context.appTheme.secondary, fontWeight: FontWeight.bold, fontSize: 16),
        iconTheme: IconThemeData(color: context.appTheme.secondary),
        bottom: PreferredSize(preferredSize: const Size(double.infinity, 2), child: Divider(color: context.appTheme.secondary)),
      ),
      body: ListView(
        children: [
          const HomeBanner(title: "Oylik To'lovlarni Kechiktirmang!"),
          CustomTextWidget("\t\t\t Today", textColor: context.appTheme.secondary, fontWeight: FontWeight.bold),
          HomeLessonWidget(
            imageUrl: "",
            lessonName: "Math",
            startTime: "11;00",
            endTime: "12:30",
          ),
          CustomTextWidget("\t\t\t Free Courses", textColor: context.appTheme.secondary, fontWeight: FontWeight.bold),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
            child: Container(
              height: 220,
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), border: Border.all(color: context.appTheme.secondary)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CustomTextWidget("Lesson Image", textColor: context.appTheme.secondary),
                    CustomTextWidget("Lesson Title", textColor: context.appTheme.secondary),
                    CustomTextWidget("Url Link Button", textColor: context.appTheme.secondary),
                    CustomTextWidget("Time of video", textColor: context.appTheme.secondary),
                  ],
                ),
              ),
            ),
          ),
          CustomTextWidget("\t\t\t Mock Exams", textColor: context.appTheme.secondary, fontWeight: FontWeight.bold),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
            child: Container(
              height: 220,
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), border: Border.all(color: context.appTheme.secondary)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CustomTextWidget("Circle avatar Title name", textColor: context.appTheme.secondary),
                    CustomTextWidget("Test Count", textColor: context.appTheme.secondary),
                  ],
                ),
              ),
            ),
          ),
          CustomTextWidget("\t\t\t Social Accounts", textColor: context.appTheme.secondary, fontWeight: FontWeight.bold),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(radius: 35, backgroundImage: AssetImage("assets/images/edu_helper_logo.png")),
                CircleAvatar(radius: 55, backgroundImage: AssetImage("assets/images/edu_helper_logo.png")),
                CircleAvatar(radius: 35, backgroundImage: AssetImage("assets/images/edu_helper_logo.png")),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class HomeLessonWidget extends StatelessWidget {
  const HomeLessonWidget(
      {super.key,
      this.firstTap,
      this.secondTap,
      this.thirdTap,
      required this.imageUrl,
      required this.lessonName,
      required this.startTime,
      required this.endTime});

  final VoidCallback? firstTap, secondTap, thirdTap;
  final String imageUrl, lessonName, startTime, endTime;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          ...List.generate(3, (index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 280,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), border: Border.all(color: context.appTheme.secondary)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 100,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                        child: CachedNetworkImage(
                          imageUrl: "imageUrl",
                          fit: BoxFit.cover,
                          placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Image.asset(
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                            "assets/images/bcg_placeholder.png",
                          ),
                        ),
                      ),
                    ),
                    CustomTextWidget("\t\t\t Lesson: $lessonName", textColor: context.appTheme.secondary),
                    CustomTextWidget("\t\t\t Time: $startTime / $endTime", textColor: context.appTheme.secondary),
                  ],
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}

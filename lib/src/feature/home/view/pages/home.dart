import 'package:edu_auxiliary/src/feature/home/view/widgets/home_free_cource_widget.dart';

import '../../../../core/constants/all_library.dart';
import '../widgets/home_banner_widget.dart';
import '../widgets/home_lesson_widget.dart';

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
          CustomTextWidget("\t\t\t Today\n", textColor: context.appTheme.secondary, fontWeight: FontWeight.bold),
          HomeLessonWidget(
              lessons: lesson,
              firstTap: () {debugPrint("item 1");},
              secondTap: () {debugPrint("item 2");},
              thirdTap: () {debugPrint("item 3");},
          ),
          CustomTextWidget("\t\t\t Free Courses\n", textColor: context.appTheme.secondary, fontWeight: FontWeight.bold),
          FreeCoursesButton(courses: freeCourses, onPressed: (){}),
          CustomTextWidget("\n\t\t\t Mock Exams", textColor: context.appTheme.secondary, fontWeight: FontWeight.bold),
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

List<Lesson> lesson = [
  Lesson(imageUrl: "imageUrl", lessonName: "Math", startTime: "09:00", endTime: "10:30"),
  Lesson(imageUrl: "imageUrl", lessonName: "Physics", startTime: "11:00", endTime: "12:30"),
  Lesson(imageUrl: "imageUrl", lessonName: "Math", startTime: "13:00", endTime: "14:30")
];

final List<FreeCourse> freeCourses = [
  FreeCourse(
    imageUrl: 'https://example.com/image1.jpg',
    title: 'Introduction to Flutter',
    videoTime: '10:00 mins',
  ),
  FreeCourse(
    imageUrl: 'https://example.com/image2.jpg',
    title: 'Advanced Dart',
    videoTime: '20:00 mins',
  ),
  FreeCourse(
    imageUrl: 'https://example.com/image3.jpg',
    title: 'UI Design Basics',
    videoTime: '15:00 mins',
  ),
];





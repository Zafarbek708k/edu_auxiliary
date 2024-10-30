import 'dart:developer';
import 'package:edu_auxiliary/src/feature/home/view/widgets/home_exam_widget.dart';
import '../../../../core/constants/all_library.dart';

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
        forceMaterialTransparency: true,
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
            firstTap: () {
              debugPrint("item 1");
            },
            secondTap: () {
              debugPrint("item 2");
            },
            thirdTap: () {
              debugPrint("item 3");
            },
          ),
          CustomTextWidget("\t\t\t Free Courses\n", textColor: context.appTheme.secondary, fontWeight: FontWeight.bold),
          FreeCoursesButton(courses: freeCourses, onPressed: () {}),
          CustomTextWidget("\n\t\t\t Mock Exams", textColor: context.appTheme.secondary, fontWeight: FontWeight.bold),
          ExamItem(
            mockExams: mockExams,
            onPressed: () {
              // Define what happens when download icon is tapped
              log('Download tapped');
            },
          ),
          CustomTextWidget("\t\t\t Social Accounts", textColor: context.appTheme.secondary, fontWeight: FontWeight.bold),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ...List.generate(
                  socialAccountImages.length,
                  (index) {
                    return InkWell(
                      child: CircleAvatar(radius: index != 1 ? 35 : 55, backgroundImage: NetworkImage(socialAccountImages[index])),
                      onTap: () {},
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

List<String> socialAccountImages = [
  "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Facebook_Logo_%282019%29.png/768px-Facebook_Logo_%282019%29.png",
  "https://goodly.co.in/wp-content/uploads/2023/10/youtube-logo-png-46016.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Instagram_icon.png/2048px-Instagram_icon.png",
];

List<Lesson> lesson = [
  Lesson(
      imageUrl: "https://t3.ftcdn.net/jpg/05/51/43/56/360_F_551435602_v0rxhHEIgbQNWozIjcgJOR2Nmp1SINMV.jpg",
      lessonName: "Math", startTime: "09:00", endTime: "10:30",
  ),
  Lesson(imageUrl: "https://cdn-icons-png.flaticon.com/512/212/212818.png", lessonName: "Physics", startTime: "11:00", endTime: "12:30"),
  Lesson(
      imageUrl: "https://png.pngtree.com/png-clipart/20190117/ourmid/pngtree-student-chemistry-class-experiment-test-tube-png-image_433993.jpg",
      lessonName: "Chemistry", startTime: "13:00", endTime: "14:30",
  )
];
final List<Exam> mockExams = [
  Exam(
    title: 'Math Exam',
    imageUrl: 'https://t3.ftcdn.net/jpg/05/51/43/56/360_F_551435602_v0rxhHEIgbQNWozIjcgJOR2Nmp1SINMV.jpg',
    count: 20,
  ),
  Exam(
    title: 'Physics Exam',
    imageUrl: 'https://t4.ftcdn.net/jpg/04/93/02/45/360_F_493024561_TV2foPQyfx7xOfo1VSJnKaQqzm0L3cUR.jpg',
    count: 15,
  ),
  Exam(
    title: 'Chemistry Exam',
    imageUrl: 'https://cdn-icons-png.flaticon.com/512/5332/5332677.png',
    count: 18
  ),
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

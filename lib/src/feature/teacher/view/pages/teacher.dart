import 'dart:developer';

import 'package:edu_auxiliary/src/core/constants/all_library.dart';
import 'package:edu_auxiliary/src/feature/widgets/main_button_widget.dart';
import '../../../../data/entity/article.dart';
import '../widgets/article_widget.dart';

class Teacher extends StatefulWidget {
  const Teacher({super.key});

  @override
  State<Teacher> createState() => _TeacherState();
}

class _TeacherState extends State<Teacher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.primary,
      appBar: AppBar(
        iconTheme: IconThemeData(color: context.appTheme.secondary),
        backgroundColor: context.appTheme.primary,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget("Teacher: Name", textColor: context.appTheme.secondary, fontWeight: FontWeight.bold, fontSize: 16),
            CustomTextWidget("Rule: Mathematics", textColor: context.appTheme.secondary, fontWeight: FontWeight.w400, fontSize: 12)
          ],
        ),
        actions: [
          MaterialButton(
            shape: CircleBorder(side: BorderSide(color: context.appTheme.secondary)),
            child: const Icon(Icons.person_2_sharp),
            onPressed: () {
              context.go("${AppRouteName.teacher}/${AppRouteName.teacherProfile}");
            },
          ),
        ],
        bottom: PreferredSize(preferredSize: const Size(double.infinity, 1), child: Divider(color: context.appTheme.secondary)),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
            child: DecoratedBox(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), border: Border.all(color: context.appTheme.secondary)),
              child: SizedBox(
                width: double.infinity,
                height: 300,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextWidget("Working hours", textColor: context.appTheme.secondary, fontWeight: FontWeight.w400),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomTextWidget("Monday", textColor: context.appTheme.secondary, fontWeight: FontWeight.w400),
                              const SizedBox(width: 150, child: Divider(color: Colors.grey, height: 1))
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 10.h),
                      ...List.generate(3, (index) {
                        return Card(color: context.appTheme.primary.withAlpha(1), child: ListTile(
                          leading: CustomTextWidget("sdf", textColor: context.appTheme.secondary),
                          title: CustomTextWidget("Math",textColor: context.appTheme.secondary,fontSize: 16, fontWeight: FontWeight.bold),
                          subtitle: CustomTextWidget("${2*index+1}:00-${2*index+3}:00",textColor: context.appTheme.secondary,fontSize: 12, fontWeight:
                          FontWeight
                              .w400),
                        ));
                      })
                    ],
                  ),
                ),
              ),
            ),
          ),
          CustomTextWidget("\t\t Groups\n", textColor: context.appTheme.secondary, fontWeight: FontWeight.bold),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ...List.generate(
                  group.length,
                  (index) => MainButton(
                    onPressed: () {},
                    width: 120,
                    height: 30,
                    horizontalPadding: 10,
                    verticalPadding: 4,
                    title: group[index],
                  ),
                )
              ],
            ),
          ),
          CustomTextWidget("\n\t\t Time Table\n", textColor: context.appTheme.secondary, fontWeight: FontWeight.bold),
          const SizedBox(height: 120),
          CustomTextWidget("\n\t\t Articles\n", textColor: context.appTheme.secondary, fontWeight: FontWeight.bold),
          SizedBox(
            height: 250,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ...List.generate(articles.length, (index) {
                  final article = articles[index];
                  return ArticleItemWidget(
                    onPressed: () {},
                    author: article.author,
                    title: article.title,
                    link: article.url,
                    height: double.infinity,
                    width: 150,
                  );
                })
              ],
            ),
          ),
          CustomTextWidget("\n\t\t Books\n", textColor: context.appTheme.secondary, fontWeight: FontWeight.bold),
        ],
      ),
    );
  }
}

List<Article> articles = [
  Article(author: "Zafarbek", title: "Math", url: "https://en.wikipedia.org/wiki/Mathematics"),
  Article(author: "Zafarbek", title: "Flutter", url: "https://en.wikipedia.org/wiki/Flutter_(software)"),
  Article(author: "Zafarbek", title: "Java", url: "https://en.wikipedia.org/wiki/Java_(programming_language)"),
  Article(author: "Zafarbek", title: "C# (C sharp)", url: "https://en.wikipedia.org/wiki/C_Sharp_(programming_language)"),
];
List<String> group = [
  "A-1",
  "A-2",
  "A-3",
  "A-4",
  "A-5",
  "A-6",
  "B-1",
  "B-2",
  "B-3",
  "B-4",
  "B-5",
  "B-6",
  "C-1",
  "C-2",
  "C-3",
  "C-4",
  "C-5",
  "C-6",
  "D-1",
  "D-2",
  "D-3",
  "D-4",
  "D-5",
  "D-6",
  "E-1",
  "E-2",
  "E-3",
  "E-4",
  "E-5",
  "E-6"
];

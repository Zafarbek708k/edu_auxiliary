import 'package:edu_auxiliary/src/core/constants/all_library.dart';

class Exam {
  final String title;
  final String imageUrl;
  final int count;

  Exam({required this.title, required this.imageUrl, required this.count});
}

class ExamItem extends StatelessWidget {
  final VoidCallback? onPressed;
  final List<Exam> mockExams;

  const ExamItem({
    super.key,
    this.onPressed,
    required this.mockExams,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: mockExams.length,
          itemBuilder: (context, index) {
            final exam = mockExams[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).colorScheme.secondary),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(exam.imageUrl),
                      radius: 30,
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 100, // Adjust width as needed
                          child: CustomTextWidget(
                            exam.title,
                            textColor: context.appTheme.secondary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        CustomTextWidget(
                          "Count: ${exam.count}",
                          textColor: context.appTheme.secondary,
                        ),
                      ],
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      onPressed: onPressed,
                      icon: Icon(Icons.download, color: context.appTheme.secondary),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

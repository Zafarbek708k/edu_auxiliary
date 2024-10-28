import 'package:edu_auxiliary/src/core/constants/all_library.dart';
import 'package:flutter/cupertino.dart';

class Lesson {
  final String imageUrl, lessonName, startTime, endTime;

  Lesson({required this.imageUrl, required this.lessonName, required this.startTime, required this.endTime});
}


class HomeLessonWidget extends StatelessWidget {
  const HomeLessonWidget({
    super.key,
    this.firstTap,
    this.secondTap,
    this.thirdTap,
    required this.lessons,
  });

  final VoidCallback? firstTap;
  final VoidCallback? secondTap;
  final VoidCallback? thirdTap;
  final List<Lesson> lessons;

  VoidCallback? _getTapCallback(int index) {
    switch (index) {
      case 0:
        return firstTap;
      case 1:
        return secondTap;
      case 2:
        return thirdTap;
      default:
        return null; // Optional: Add a default action if more than 3 lessons
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: lessons.length,
        itemBuilder: (context, index) {
          final model = lessons[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CupertinoButton(
              onPressed: _getTapCallback(index),
              padding: EdgeInsets.zero,
              child: Container(
                width: 280,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Theme.of(context).colorScheme.secondary),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildImageSection(model.imageUrl),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            "Lesson: ${model.lessonName}",
                            textColor: Theme.of(context).colorScheme.secondary,
                          ),
                          CustomTextWidget(
                            "Time: ${model.startTime} / ${model.endTime}",
                            textColor: Theme.of(context).colorScheme.secondary,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildImageSection(String imageUrl) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
      child: SizedBox(
        height: 100,
        width: double.infinity,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => Image.asset(
            "assets/images/bcg_placeholder.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

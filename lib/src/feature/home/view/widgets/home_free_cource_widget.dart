
import 'package:edu_auxiliary/src/core/constants/all_library.dart';

class FreeCourse {
  final String imageUrl;
  final String title;
  final String videoTime;

  FreeCourse({
    required this.imageUrl,
    required this.title,
    required this.videoTime,
  });
}


class FreeCoursesButton extends StatelessWidget {
  final List<FreeCourse> courses;
  final VoidCallback? onPressed;
  const FreeCoursesButton({super.key, required this.courses, this.onPressed});


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: _buildCourseCard(context, course, onPressed),
          );
        },
      ),
    );
  }

  Widget _buildCourseCard(BuildContext context, FreeCourse course, VoidCallback? onPressed) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Theme.of(context).colorScheme.secondary),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: SizedBox(
              height: 100,
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl: course.imageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Image.asset(
                  "assets/images/bcg_placeholder.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.title,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Time: ${course.videoTime}",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                  child: const Text('Watch Now'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

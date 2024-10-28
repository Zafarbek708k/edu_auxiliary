import 'package:edu_auxiliary/src/core/constants/all_library.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
      child: Container(
        height: 220,
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), border: Border.all(color: context.appTheme.secondary)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 155,
                width: double.infinity,
                child: CachedNetworkImage(
                  imageUrl: "https://i.pinimg.com/564x/95/c1/13/95c11352ff99a65cf86b3c9a9c1582a0.jpg",
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Center(child: CircularProgressIndicator(color: context.appTheme.secondary)),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: CustomTextWidget(title, textColor: context.appTheme.secondary),
              )
            ],
          ),
        ),
      ),
    );
  }
}
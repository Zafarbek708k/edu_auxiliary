import 'package:edu_auxiliary/src/core/constants/all_library.dart';
import 'package:edu_auxiliary/src/feature/auth/view/widgets/logo_animation.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Timer? _timer;

  Future<void> init() async {
    _timer = Timer(const Duration(seconds: 4), () {
      if (mounted) context.go(AppRouteName.selectRule);
    });
  }

  @override
  void didChangeDependencies() async {
    await init();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomFadeAnimation(child: SizedBox(height: 220, width: double.infinity, child: SvgPicture.asset("assets/images/slpash_image.svg"))),
            const SizedBox(height: 10),
            CustomFadeAnimation(child: CustomTextWidget("Welcome to Edu Auxiliary", textColor: context.appTheme.secondary)),
          ],
        ),
      ),
    );
  }
}

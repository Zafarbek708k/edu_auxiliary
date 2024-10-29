import 'dart:developer';

import 'package:edu_auxiliary/src/core/constants/all_library.dart';
import 'package:edu_auxiliary/src/feature/auth/view/pages/select_rule.dart';
import 'package:edu_auxiliary/src/feature/home/view/pages/home.dart';
import 'package:edu_auxiliary/src/feature/teacher/view/pages/teacher.dart';
class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  String userRole = "";
  bool isLoading = true;

  Future<void> _fetchUserRole() async {
    String? role = await StorageService.loadData(key: SharedPrefKey.student) ??
        await StorageService.loadData(key: SharedPrefKey.teacher) ??
        "";
    setState(() {
      userRole = role;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchUserRole();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: Center(child: CircularProgressIndicator())));
    }

    return StreamBuilder(
      stream: AuthService.auth.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasData) {
          switch (userRole) {
            case "teacher":
              WidgetsBinding.instance.addPostFrameCallback((_) {
                context.go(AppRouteName.teacher);
              });
              break;
            case "student":
              WidgetsBinding.instance.addPostFrameCallback((_) {
                context.go(AppRouteName.home);
              });
              break;
            default:
              WidgetsBinding.instance.addPostFrameCallback((_) {
                context.go(AppRouteName.selectRule);
              });
          }
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        } else {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.go(AppRouteName.selectRule);
          });
          return Scaffold(
            body: Center(
              child: CustomTextWidget(
                "Error page",
                textColor: context.appTheme.secondary,
              ),
            ),
          );
        }
      },
    );
  }
}


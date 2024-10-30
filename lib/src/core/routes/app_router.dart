import "package:edu_auxiliary/src/core/constants/all_library.dart";
import "package:edu_auxiliary/src/feature/auth/view/pages/auth_gate.dart";
import "package:edu_auxiliary/src/feature/auth/view/pages/select_rule.dart";
import "package:edu_auxiliary/src/feature/course/view/pages/course.dart";
import "package:edu_auxiliary/src/feature/home/view/pages/home.dart";
import "package:edu_auxiliary/src/feature/inbox/view/pages/inbox.dart";
import "package:edu_auxiliary/src/feature/profile/view/pages/profile.dart";
import "package:edu_auxiliary/src/feature/teacher/view/pages/teacher.dart";
import "package:edu_auxiliary/src/feature/teacher/view/pages/teacher_profile.dart";

import "../../feature/home_navigation.dart";

final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell-key');

final GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell-key');
late StatefulNavigationShell navigationShell2;

@immutable
final class AppRouter {
  const AppRouter._();

  static final GoRouter router = GoRouter(
    navigatorKey: appNavigatorKey,
    initialLocation: AppRouteName.splash,
    routes: [
      GoRoute(path: AppRouteName.splash, builder: (context, state) => const Splash()),
      GoRoute(path: AppRouteName.selectRule, builder: (context, state) => const SelectRule()),
      GoRoute(path: AppRouteName.teacher, builder: (context, state) => const Teacher(), routes: [
        GoRoute(path: AppRouteName.teacherProfile, builder: (context, state) => const TeacherProfile()),
      ]),
      GoRoute(path: AppRouteName.authGate, builder: (context, state) => const AuthGate()),

      GoRoute(
        path: AppRouteName.login,
        builder: (context, state) => const Login(),
        routes: [
          GoRoute(path: AppRouteName.register, builder: (context, state) => const Register()),
          GoRoute(path: AppRouteName.forgetPassword, builder: (context, state) => const ForgotPassword()),
        ],
      ),

      /// Patient Shell Route
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: appNavigatorKey,
        builder: (context, state, navigationShell) {
          navigationShell2 = navigationShell;
          return HomeNavigation(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorKey,
            routes: [
              GoRoute(
                path: AppRouteName.home,
                pageBuilder: (context, state) => const NoTransitionPage(child: Home()),
                routes: [
                  // SubRoutes.categoryDetail,
                  SubRoutes.subject,
                  GoRoute(
                    parentNavigatorKey: appNavigatorKey,
                    path: AppRouteName.favorite,
                    pageBuilder: (BuildContext context, GoRouterState state) {
                      // bu sub pagedan turib asosiy pagega qaytganda bottom navbardi ozgartirish uchun kerak bo'ladi
                      // return MaterialPage(child: Favorite(navigationShell: navigationShell2));
                      return const MaterialPage(child: Scaffold());
                    },
                  )
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRouteName.courses,
                pageBuilder: (context, state) => const NoTransitionPage(child: Course()),
                routes: const [],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRouteName.inbox,
                pageBuilder: (context, state) => const NoTransitionPage(child: Inbox()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRouteName.profile,
                pageBuilder: (context, state) => const NoTransitionPage(child: Profile()),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

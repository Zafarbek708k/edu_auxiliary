import "package:edu_auxiliary/src/core/constants/all_library.dart";
import "package:edu_auxiliary/src/feature/home/view/pages/subject.dart";




@immutable
class SubRoutes{
  static final GoRoute catalogDetail = GoRoute(
      parentNavigatorKey: appNavigatorKey,
      path: AppRouteName.catalogDetail,
      pageBuilder: (BuildContext context, GoRouterState state) => const MaterialPage(
        // child: Modules(argument: state.extra as Fan),
        child: Scaffold(),
      ),
      routes: [categoryDetail, catalogItemInfo]);

  static final GoRoute categoryDetail = GoRoute(
    parentNavigatorKey: appNavigatorKey,
    path: AppRouteName.categoryDetail,
    pageBuilder: (BuildContext context, GoRouterState state) {
      return const MaterialPage(child: Scaffold());
      // child: ModuleLessons(argument: state.extra! as Fan),
    },
    routes: const [],
  );





  /// more sub routes
  static final GoRoute subject = GoRoute(
    parentNavigatorKey: appNavigatorKey,
    path: AppRouteName.subject,
    pageBuilder: (BuildContext context, GoRouterState state) {
      return const MaterialPage(child: Subject());
    },
  );

  static final GoRoute viewed = GoRoute(
    parentNavigatorKey: appNavigatorKey,
    path: AppRouteName.viewed,
    pageBuilder: (BuildContext context, GoRouterState state) {
      return const MaterialPage(child: Scaffold());
    },
    routes: [catalogItemInfo]
  );
  static final GoRoute profile = GoRoute(
    parentNavigatorKey: appNavigatorKey,
    path: AppRouteName.profile,
    pageBuilder: (BuildContext context, GoRouterState state) {
      return const MaterialPage(child: Scaffold());
    },
  );
  static final GoRoute setting = GoRoute(
    parentNavigatorKey: appNavigatorKey,
    path: AppRouteName.setting,
    pageBuilder: (BuildContext context, GoRouterState state) {
      return const MaterialPage(child: Scaffold());
    },
  );
  static final GoRoute catalogItemInfo = GoRoute(
    parentNavigatorKey: appNavigatorKey,
    path: AppRouteName.catalogItemInfo,
    pageBuilder: (BuildContext context, GoRouterState state) {
      return const MaterialPage(child: Scaffold());
    },
  );
  static final GoRoute blockedUsers = GoRoute(
    parentNavigatorKey: appNavigatorKey,
    path: AppRouteName.blockedUsers,
    pageBuilder: (BuildContext context, GoRouterState state) {
      return const MaterialPage(child: Scaffold());
    },
  );




}
import "package:edu_auxiliary/src/core/constants/all_library.dart";


extension CustomContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get screenSize => mediaQuery.size;
  ThemeData get theme => Theme.of(this);
  ColorScheme get appTheme => Theme.of(this).colorScheme; // Theme.of(context).colorScheme
  AppTextStyle get appTextStyle => AppTextStyle(this);
  AppLocalizations get localized => AppLocalizations.of(this)!;
}

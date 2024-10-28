import '../../../../core/constants/all_library.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    super.key,
    required this.bottomLine,
    required this.topLine,
    required this.title,
    this.rightWidget,
    this.onTap, this.textColor,
  });

  final bool bottomLine;
  final bool topLine;
  final String title;
  final Widget? rightWidget;
  final VoidCallback? onTap;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (topLine) Divider(color: Theme.of(context).colorScheme.secondary, thickness: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextWidget("\t\t $title\t", textColor:textColor ?? context.appTheme.secondary, fontSize: 16),
                if (rightWidget != null) rightWidget!
              ],
            ),
            if (bottomLine) Divider(color: Theme.of(context).colorScheme.secondary, thickness: 2),
          ],
        ),
      ),
    );
  }
}

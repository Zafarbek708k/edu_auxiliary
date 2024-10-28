import 'package:flutter/material.dart';
import 'package:edu_auxiliary/src/core/constants/context_extension.dart';

import '../../../../core/widgets/text_widget.dart';

class AuthMainButton extends StatelessWidget {
  const AuthMainButton({
    super.key,
    this.minWith = double.infinity,
    this.height = 50,
    this.radius = 10,
    this.onPressed,
    this.imageName,
    this.fontSize = 16,
    this.title,
    this.backgroundColor,
    this.borderColor = Colors.transparent,
    this.textColor
  });

  final double? minWith, height, radius, fontSize;
  final VoidCallback? onPressed;
  final String? imageName, title;
  final Color? backgroundColor, borderColor, textColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      height: height,
      onPressed: onPressed,
      color: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius!), side: BorderSide(color: borderColor!)),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            imageName != null
                ? Container(
              margin: const EdgeInsets.all(4),
              height: 35,
              width: 35,
              decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/icons/googleLogo.png"))),
            )
                : const SizedBox.shrink(),
            CustomTextWidget(
              title ?? "",
              textColor: textColor ?? context.appTheme.secondary,
              fontWeight: FontWeight.w400,
              fontSize: fontSize,
            )
          ],
        ),
      ),
    );
  }
}
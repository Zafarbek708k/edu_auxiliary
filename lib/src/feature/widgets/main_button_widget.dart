import 'package:edu_auxiliary/src/core/constants/all_library.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton(
      {super.key,
        required this.onPressed,
        this.bcgColor,
        this.borderColor,
        this.txtColor,
        this.title,
        this.height,
        this.width,
        this.radius,
        this.fontSize, this.horizontalPadding, this.verticalPadding, this.leftIcon, this.rightIcon});

  final VoidCallback onPressed;
  final Color? bcgColor, borderColor, txtColor;
  final String? title;
  final Widget? leftIcon, rightIcon;
  final double? height, width, radius, fontSize, horizontalPadding, verticalPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  REdgeInsets.symmetric(horizontal: horizontalPadding ?? 0.0, vertical:verticalPadding ?? 0.0),
      child: MaterialButton(
        onPressed: onPressed,
        minWidth: width ?? double.infinity,
        height: height ?? 45,
        color: bcgColor ?? Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 15),
          side: BorderSide(color: borderColor ?? context.appTheme.secondary),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              leftIcon ?? const SizedBox.shrink(),
              SizedBox(width: leftIcon != null ? 20:0),
              CustomTextWidget(title ?? "", textColor: txtColor ?? context.appTheme.secondary, fontSize: fontSize),
              SizedBox(width: rightIcon != null ? 20:0),
              rightIcon ?? const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
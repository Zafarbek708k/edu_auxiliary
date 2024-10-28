import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:edu_auxiliary/src/core/constants/context_extension.dart';
import 'package:edu_auxiliary/src/core/widgets/text_widget.dart';

class CustomRadioButton extends StatelessWidget {
  final bool selected;
  final VoidCallback? onTap;
  final String? text;
  final bool isDisabled;
  final double? fontSize;

  const CustomRadioButton({
    super.key,
    required this.selected,
    this.onTap,
    this.text,
    this.isDisabled = false,
    this.fontSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: isDisabled ? null : onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _getIcon(),
          if (text != null)
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: CustomTextWidget(
                text!,
                fontSize: fontSize,
                textColor: context.appTheme.secondary,
                fontWeight: FontWeight.w600,
              ),
            ),
        ],
      ),
    );
  }

  Widget _getIcon() {
    if (isDisabled) {
      return SvgPicture.asset("assets/icons/radio-selected.svg");
    }
    if (selected) {
      return SvgPicture.asset("assets/icons/radio-selected.svg");
    }
    return SvgPicture.asset("assets/icons/radio-unselected.svg");
  }
}



import 'package:edu_auxiliary/src/core/constants/all_library.dart';
import 'package:flutter/cupertino.dart';

class ArticleItemWidget extends StatelessWidget {
  const ArticleItemWidget({
    super.key,
    required this.onPressed,
    this.height,
    this.width,
    this.fontSize,
    this.bcgColor,
    this.txtColor,
    this.borderColor,
    this.author,
    this.title,
    this.link,
  });

  final VoidCallback onPressed;
  final double? height, width, fontSize;
  final Color? bcgColor, txtColor, borderColor;
  final String? author, title, link;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      child: Container(
        height: height ?? 120,
        width: width ?? 60,
        decoration: BoxDecoration(
            color: bcgColor ?? Colors.transparent,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: borderColor ?? context.appTheme.secondary, width: 1)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget("\nAuthor: ${author ?? ""}\n", textColor: txtColor ?? context.appTheme.secondary, fontSize: 12),
              CustomTextWidget("Title: ${title!}" ?? "", textColor: txtColor ?? context.appTheme.secondary, fontSize: 10),
              Spacer(),
              Center(
                child: MaterialButton(
                  onPressed: () {},
                  shape: StadiumBorder(side: BorderSide(color: context.appTheme.secondary)),
                  child: const CustomTextWidget("Link", textColor: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
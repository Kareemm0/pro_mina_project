import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomMaterialButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final double? width;
  final Color? buttonColor;
  final BorderRadiusGeometry? borderRadius;
  final Widget widget;
  const CustomMaterialButton(
      {super.key,
      this.onPressed,
      required this.text,
      this.fontSize,
      this.fontWeight,
      this.color,
      this.width,
      this.buttonColor,
      this.borderRadius,
      required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        color: buttonColor ?? AppColors.blue,
        borderRadius: borderRadius ?? BorderRadius.circular(8),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget,
            const SizedBox(width: 8),
            Align(
              alignment: Alignment.center,
              child: Text(
                text,
                style: TextStyle(
                    fontSize: fontSize ?? 20,
                    fontWeight: fontWeight ?? FontWeight.bold,
                    color: color ?? AppColors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

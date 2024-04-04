import 'package:flutter/material.dart';
import 'package:pro_mina_project/core/utils/app_colors.dart';

class CustomTextFromFiled extends StatelessWidget {
  final String hinText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const CustomTextFromFiled({
    super.key,
    required this.hinText,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        hintText: hinText,
        fillColor: AppColors.white,
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: AppColors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: AppColors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: AppColors.white),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: AppColors.white),
        ),
      ),
    );
  }
}

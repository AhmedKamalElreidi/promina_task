import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promina_task/core/util/app_colors/app_colors.dart';
import 'package:promina_task/core/util/app_colors/app_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.validator,
    required this.keyboardType,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 20.w),
        hintText: hintText,
        hintStyle: AppStyles.textStyle16,
        filled: true,
        fillColor: AppColors.whiteColor,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.r),
            borderSide: const BorderSide(color: AppColors.whiteColor)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.r),
            borderSide: const BorderSide(color: AppColors.whiteColor)),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.r),
            borderSide: const BorderSide(color: AppColors.whiteColor)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.r),
            borderSide: const BorderSide(color: AppColors.whiteColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.r),
            borderSide: const BorderSide(color: AppColors.whiteColor)),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:promina_task/core/util/app_colors/app_styles.dart';
import 'package:promina_task/core/util/spaces/spaces.dart';

class CustomDialogButton extends StatelessWidget {
  const CustomDialogButton({
    super.key,
    required this.text,
    required this.img,
    required this.onTap,
    required this.color,
  });
  final String text, img;
  final void Function() onTap;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                img,
                height: 30.h,
                width: 30,
              ),
              widthSpace(5.w),
              Text(
                text,
                style: AppStyles.textStyle27,
              ),
            ],
          )),
    );
  }
}
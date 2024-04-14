import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:promina_task/core/util/app_colors/app_colors.dart';
import 'package:promina_task/core/util/app_colors/app_styles.dart';
import 'package:promina_task/core/util/spaces/spaces.dart';

class CustomGalleryButton extends StatelessWidget {
  const CustomGalleryButton({
    super.key,
    required this.text,
    required this.img,
    required this.onTap,
  });
  final String text, img;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              img,
              height: 20.h,
              width: 20,
            ),
            widthSpace(10.w),
            Text(
              text,
              style: AppStyles.textStyle20,
            )
          ],
        ),
      ),
    );
  }
}

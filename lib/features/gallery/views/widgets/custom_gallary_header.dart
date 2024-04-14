import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promina_task/core/util/app_colors/app_colors.dart';
import 'package:promina_task/core/util/app_colors/app_styles.dart';
import 'package:promina_task/core/util/app_images/app_images.dart';

class CustomGallaryHeader extends StatelessWidget {
  const CustomGallaryHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Ahmed\nKamal",
          style: AppStyles.textStyle32,
        ),
        CircleAvatar(
          radius: 30.r,
          backgroundColor: AppColors.whiteColor,
          backgroundImage: const AssetImage(
            AppAssets.person,
          ),
        )
      ],
    );
  }
}

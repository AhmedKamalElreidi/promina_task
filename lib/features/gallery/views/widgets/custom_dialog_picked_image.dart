import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promina_task/core/util/app_colors/app_colors.dart';
import 'package:promina_task/core/util/app_images/app_images.dart';
import 'package:promina_task/core/util/spaces/spaces.dart';

import 'custom_dialog_button.dart';

class CustomDialogPickedImage extends StatelessWidget {
  const CustomDialogPickedImage({super.key, required this.galleryFunc, required this.cameraFunc});
  final void Function() galleryFunc;
  final void Function() cameraFunc;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding:
          EdgeInsetsDirectional.symmetric(horizontal: 60.w, vertical: 40.h),
      backgroundColor: AppColors.whiteColor.withOpacity(0.4),
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: AppColors.whiteColor, width: 0.3),
        borderRadius: BorderRadius.circular(20.0),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomDialogButton(
            text: "Gellary",
            img: AppAssets.galleryIcon,
            color: AppColors.lightRoseColor,
            onTap: galleryFunc,
          ),
          heightSpace(30.h),
          CustomDialogButton(
            text: "Camera",
            img: AppAssets.camera,
            color: AppColors.lightBlueColor,
            onTap: cameraFunc,
          ),
        ],
      ),
    );
  }
}

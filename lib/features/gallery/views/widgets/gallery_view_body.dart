import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promina_task/core/util/app_images/app_images.dart';
import 'package:promina_task/core/util/spaces/spaces.dart';

import 'custom_gallary_header.dart';
import 'custom_gallery_list.dart';
import 'custom_gallery_upload_and_logout.dart';

class GalleryViewBody extends StatelessWidget {
  const GalleryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 15.h),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              AppAssets.galleryBg,
            ),
            fit: BoxFit.fill),
      ),
      child: Column(
        children: [
          const CustomGallaryHeader(),
          heightSpace(40.h),
          const CustomGalleryUploadAndLogout(),
          heightSpace(30.h),
          const CustomGalleryList()
        ],
      ),
    );
  }
}
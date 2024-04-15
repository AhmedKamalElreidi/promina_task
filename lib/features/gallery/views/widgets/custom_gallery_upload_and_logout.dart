import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promina_task/core/util/app_functions/app_functions.dart';
import 'package:promina_task/core/util/app_images/app_images.dart';
import 'package:promina_task/core/util/spaces/spaces.dart';
import 'package:promina_task/features/gallery/view_model/gallery_cubit.dart';
import 'package:promina_task/features/gallery/views/gallery_view.dart';

import 'custom_dialog_picked_image.dart';
import 'custom_gallery_button.dart';

class CustomGalleryUploadAndLogout extends StatelessWidget {
  const CustomGalleryUploadAndLogout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GalleryCubit, GalleryState>(
      listener: (context, state) {
          if (state is AddImagesLoadingState) {
              const Center(child: CircularProgressIndicator());
            }
            if (state is AddImagesSuccessState) {
              AppFunctions.showToast(text: "Add Image Success");
              AppFunctions.navigateTo(
                  context: context, navigatedScreen: const GalleryView());
            }
      },
      builder: (context, state) {
                var cubit = GalleryCubit.get(context);
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomGalleryButton(
                text: "Log Out", img: AppAssets.logout, onTap: () {}),
            widthSpace(20.w),
            CustomGalleryButton(
                text: "upload",
                img: AppAssets.upload2,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => CustomDialogPickedImage(
                      galleryFunc: () {

                        cubit
                            .pickFromGallery(context: context)
                            .then((value) => cubit.uploadImage());
                      },
                      cameraFunc: () {
       
                        cubit
                            .pickFromGallery(context: context)
                            .then((value) => cubit.uploadImage());
               
                      },
                    ),
                  );
                }),
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promina_task/core/util/app_images/app_images.dart';
import 'package:promina_task/core/util/spaces/spaces.dart';
import 'package:promina_task/features/gallery/view_model/gallery_cubit.dart';

import 'custom_dialog_picked_image.dart';
import 'custom_gallery_button.dart';

class CustomGalleryUploadAndLogout extends StatelessWidget {
  const CustomGalleryUploadAndLogout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GalleryCubit, GalleryState>(
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
                        // cubit.pickImageFrom(type: ImageSource.gallery);
                        // cubit.uploadImage();
                        // ImagePicker()
                        //     .pickImage(source: ImageSource.gallery)
                        //     .then((value) =>
                        //         cubit.uploadProfilePic(value! as File?));
                        cubit.pickFromGallery(context: context);
                        Navigator.pop(context);
                      },
                      cameraFunc: () {
                        //          cubit.pickImageFrom(type: ImageSource.camera);
                        // cubit.uploadImage();
                        // ImagePicker()
                        //     .pickImage(source: ImageSource.camera)
                        //     .then((value) =>
                        //         cubit.uploadProfilePic(value as File?));
                        cubit.pickFromGallery(context: context);
                        Navigator.pop(context);
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

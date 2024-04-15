import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promina_task/features/gallery/view_model/gallery_cubit.dart';

import 'custom_gallery_item.dart';

class CustomGalleryList extends StatelessWidget {
  const CustomGalleryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GalleryCubit, GalleryState>(
      builder: (context, state) {
        var cubit = GalleryCubit.get(context);
        if (cubit.galleryModel != null) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 20.h,
                crossAxisSpacing: 20.w),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: cubit.galleryModel?.data?.images!.length,
            itemBuilder: (context, index) => CustomGalleryItem(
              img: cubit.galleryModel?.data?.images![index] ?? "",
            ),
          );
        } else if (state is GetImagesLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return const Center(child: Text("No images"));
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGalleryItem extends StatelessWidget {
  const CustomGalleryItem({super.key, required this.img});
  final String img;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.network(
        img,
        width: 150.w,
        height: 100.h,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return SizedBox(
              width: 160.w,
              height: 100.h,
              child: const Icon(
                Icons.error,
              ));
        },
      ),
    );
  }
}

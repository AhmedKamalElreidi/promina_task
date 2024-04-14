import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:promina_task/core/constant/end_points/end_points.dart';
import 'package:promina_task/core/helper/network/dio_helper.dart';
import 'package:promina_task/core/util/secure_keys/secure_variable.dart';
import 'package:promina_task/features/gallery/model/gallery_model.dart';

part 'gallery_state.dart';

class GalleryCubit extends Cubit<GalleryState> {
  GalleryCubit() : super(GalleryInitial());
  static GalleryCubit get(context) => BlocProvider.of(context);

  GalleryModel? galleryModel;
  Future<void> getGalleryImages() async {
    emit(GetImagesLoadingState());
    final response = await DioHelper.getData(
        url: EndPoints.myGallery, token: SecureVariables.token);
    if (response.statusCode == 200) {
      galleryModel = GalleryModel.fromJson(response.data);
      emit(GetImagesSuccessState(galleryModel!));
    } else {
      emit(GetImagesErrorState(error: response.statusMessage!));
    }
  }

  // Future<void> uploadImage() async {
  //   emit(AddImagesLoadingState());
  //   String fileName = file!.path.split('/').last;
  //   FormData formData = FormData.fromMap({
  //     "img": await MultipartFile.fromFile(file!.path, filename: fileName),
  //   });
  //   final response = await DioHelper.postData(
  //       url: EndPoints.uploadImage,
  //       token: SecureVariables.token,
  //       data: formData);
  //   if (response.statusCode == 200) {
  //     emit(AddImagesSuccessState());
  //   } else {
  //     emit(AddImagesErrorState(error: ''));
  //   }
  // }

  // File? file;
  // Future<void> pickImageFrom({required ImageSource type}) async {
  //   final pickedFile = await ImagePicker().pickImage(
  //     source: type,
  //     imageQuality: 60,
  //   );
  //   if (pickedFile == null) return;
  //   file = File(pickedFile.path);
  //   emit(PickedImageSuccess());
  // }
}

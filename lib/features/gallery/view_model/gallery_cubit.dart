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

  // // Profile Pic
  // File? profilePic;
  // uploadProfilePic(File? image) {
  //   profilePic = File(image!.path);
  //   emit(PickedImageSuccess());
  // }
  File? file;

  Future<void> pickFromGallery({required BuildContext context}) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 60,
    );
    if (pickedFile == null) return;
    file = File(pickedFile.path);
    emit(PickedImageSuccess());
  }

  Future<void> uploadImage() async {
    emit(AddImagesLoadingState());
    final response = await DioHelper.postDataImage(
        url: EndPoints.uploadImage,
        token: SecureVariables.token,
        data: {
          "img": file == null ? null : await MultipartFile.fromFile(file!.path)
        });
    if (response.statusCode == 200) {
      emit(AddImagesSuccessState());
    } else {
      emit(AddImagesErrorState(error: response.statusMessage!));
    }
  }

  // File? file;
  // Future<void> pickImageFrom({required ImageSource type}) async {
  //   final pickedFile = await ImagePicker().pickImage(
  //     source: type,
  //     imageQuality: 60,
  //   );
  //   if (pickedFile == null && pickedFile?.path == null) return;
  //   file = File(pickedFile.path);
  //   emit(PickedImageSuccess());
  // }
}
    //    data: {"img": await AppFunctions.uploadImageToAPI(profilePic!)});

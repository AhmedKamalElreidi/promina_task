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


  File? selectedImage; 

 Future<void> pickFromGallery({required BuildContext context}) async {
  try {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 60,
    );
    if (pickedFile == null) return;
    selectedImage = File(pickedFile.path);
    emit(PickedImageSuccess()); 
  } on Exception catch (error) {
  
    print(error.toString()); 
    emit(ImagePickerErrorState(error: error.toString())); 
  }
}

  Future<void> uploadImage() async {
    emit(AddImagesLoadingState());

    try {
      if (selectedImage == null) {
        throw Exception(
            'No image selected for upload'); 
      }
      final multipartFile = await MultipartFile.fromFile(selectedImage!.path);
      final dioBody = {
        "img": multipartFile, 
      };
      final response = await DioHelper.postData(
          url: EndPoints.uploadImage,
          token: SecureVariables.token,
          data: FormData.fromMap(dioBody));

      if (response.statusCode == 200) {
        emit(AddImagesSuccessState());
      } else {
        emit(AddImagesErrorState(error: response.statusMessage!));
      }
    } on Exception catch (error) {
      print(error.toString()); 
      emit(UploadImageErrorState(
          error: error.toString())); 
    }
  }


}

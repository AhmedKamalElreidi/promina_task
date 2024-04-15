part of 'gallery_cubit.dart';

@immutable
class GalleryState {}

class GalleryInitial extends GalleryState {}

class PickedImageSuccess extends GalleryState {}

final class GetImagesLoadingState extends GalleryState {}

final class GetImagesSuccessState extends GalleryState {
  final GalleryModel galleryModel;

  GetImagesSuccessState(this.galleryModel);
}

final class GetImagesErrorState extends GalleryState {
  final String error;

  GetImagesErrorState({required this.error});
}

final class AddImagesLoadingState extends GalleryState {}

final class AddImagesSuccessState extends GalleryState {}

final class AddImagesErrorState extends GalleryState {
  final String error;

  AddImagesErrorState({required this.error});
}

final class UploadImageErrorState extends GalleryState {
  final String error;

  UploadImageErrorState({required this.error});
}

final class ImagePickerErrorState extends GalleryState {
  final String error;

  ImagePickerErrorState({required this.error});
}

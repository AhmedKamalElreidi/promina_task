class GalleryModel {
  String? status;
  Data? data;
  String? message;

  GalleryModel({this.status, this.data, this.message});

  factory GalleryModel.fromJson(Map<String, dynamic> json) => GalleryModel(
        status: json['status'] as String?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data?.toJson(),
        'message': message,
      };
}

class Data {
  List<String>? images;

  Data({this.images});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        images: json['images'] as List<String>?,
      );

  Map<String, dynamic> toJson() => {
        'images': images,
      };
}

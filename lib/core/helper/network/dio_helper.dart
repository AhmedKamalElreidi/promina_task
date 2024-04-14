// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:promina_task/core/constant/end_points/end_points.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: EndPoints.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
  }

  //************************************  postdata  *********************************

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    dynamic data,
    String lang = 'en',
    String? token,
  }) async {
    try {
      dio.options.headers = {
        'Authorization': 'bearer $token',
        "Accept": "application/json"
      };
      return await dio.post(url,
          queryParameters: query,
          data: data,
          options: Options(
            validateStatus: (_) => true,
            contentType: Headers.jsonContentType,
            responseType: ResponseType.json,
          ));
    } catch (error) {
      print(error.toString());
      rethrow;
    }
  }

  //************************************      getdata  *********************************

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    try {
      dio.options.headers = {
        'Authorization': 'bearer $token',
        "Accept": "application/json"
      };
      return await dio.get(url,
          queryParameters: query,
          options: Options(
            validateStatus: (_) => true,
            contentType: Headers.jsonContentType,
            responseType: ResponseType.json,
          ));
    } catch (error) {
      print(error.toString());
      rethrow;
    }
  }
  //************************************      delete data  *********************************

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
    dynamic data,
    String lang = 'en',
    String? token,
  }) async {
    try {
      dio.options.headers = {
        'Authorization': 'Bearer $token',
      };
      return await dio.delete(url, queryParameters: query, data: data);
    } catch (error) {
      print(error.toString());
      rethrow;
    }
  }
}

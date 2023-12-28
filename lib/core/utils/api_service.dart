import 'package:dio/dio.dart';

abstract class ApiServices {
  static late Dio _dio;

  static init() {
    _dio = Dio(BaseOptions(
      baseUrl: 'https://www.googleapis.com/books/v1/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Map<String, dynamic>> get({
    required String endPoint,
    required Map<String, dynamic> query,
  }) async {
    var response = await _dio.get(
      endPoint,
      queryParameters: query,
    );
    return response.data;
  }
}

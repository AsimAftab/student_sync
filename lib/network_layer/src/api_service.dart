import 'package:dio/dio.dart';

import 'api_exceptions.dart';
import 'api_response.dart';
import 'http_middleware.dart';


class ApiService {
  final Dio dio = HttpMiddleware().dio;

  Future<ApiResponse<T>> get<T>(String endpoint, {Map<String, dynamic>? params}) async {
    try {
      final response = await dio.get(endpoint, queryParameters: params);
      return ApiResponse.success(response.data);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<ApiResponse<T>> post<T>(String endpoint, {dynamic data}) async {
    try {
      final response = await dio.post(endpoint, data: data);
      return ApiResponse.success(response.data);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }
}

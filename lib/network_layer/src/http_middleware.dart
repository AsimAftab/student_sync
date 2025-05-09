import 'package:dio/dio.dart';

import 'package:logger/logger.dart';
import 'package:student_sync/network_layer/src/token_manager.dart';

import 'package:student_sync/config/config.dart';  // Ensure this is the correct path

import 'cache_manager.dart';

var logger = Logger();

class HttpMiddleware {
  static final HttpMiddleware _instance = HttpMiddleware._internal();
  factory HttpMiddleware() => _instance;

  late final Dio dio;

  HttpMiddleware._internal() {
    _initializeDio();
  }

  void _initializeDio() {
    dio = Dio(BaseOptions(
      baseUrl: AppConfig().baseUrl,  // Using baseUrl from _Config
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      contentType: 'application/json',
    ));

    dio.interceptors.addAll([
      _authInterceptor(),
      CacheManager.cacheInterceptor,
      _loggingInterceptor(),
    ]);
  }

  InterceptorsWrapper _authInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        String? token = await TokenManager.getAccessToken();
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        logger.d('Request: ${options.method} ${options.uri}');
        return handler.next(options);
      },
      onError: (DioException error, handler) async {
        if (error.response?.statusCode == 401) {
          logger.w('Token expired, trying refresh...');
          bool success = await TokenManager.refreshToken();
          if (success) {
            final newToken = await TokenManager.getAccessToken();
            error.requestOptions.headers['Authorization'] = 'Bearer $newToken';
            return handler.resolve(await dio.fetch(error.requestOptions));
          }
        }
        return handler.next(error);
      },
    );
  }

  LogInterceptor _loggingInterceptor() {
    return LogInterceptor(
      requestBody: true,
      responseBody: true,
      logPrint: (object) => logger.d(object),
    );
  }
}

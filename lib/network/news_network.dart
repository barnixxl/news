import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import '../config/app_config.dart';
import '../models/news_error.dart';
import '../models/news_result.dart';

class NewsNetwork {
  static final GetIt _getIt = GetIt.instance;
  late final Dio _dio;

  void register(GetIt getIt) {
    getIt.registerSingleton<NewsNetwork>(this);
  }

  static NewsNetwork getInstance() {
    return _getIt<NewsNetwork>();
  }

  Future<void> initializeDependencies() async {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.baseUrl,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
      ),
    );
    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(request: false, requestBody: true, responseBody: true, error: true));
    }
  }

  Future<NewsResult<T>> get<T>(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get<T>(path, queryParameters: queryParameters);
      final data = response.data;
      if (data != null) {
        return NewsResult.success(data);
      }
      return NewsResult.failure(NewsError.loadFailed());
    } on DioException catch (e) {
      return NewsResult.failure(_mapDioError(e));
    } catch (e) {
      return NewsResult.failure(NewsError.fromException(e));
    }
  }

  NewsError _mapDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NewsError.timeout();
      case DioExceptionType.badCertificate:
        return NewsError.badResponse(0);
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode ?? 0;
        if (statusCode >= 500) {
          return NewsError.serverError(statusCode);
        }
        return NewsError.badResponse(statusCode);
      case DioExceptionType.cancel:
        return NewsError.cancelled();
      case DioExceptionType.connectionError:
        return NewsError.noInternet();
      case DioExceptionType.transformTimeout:
        return NewsError.timeout();
      case DioExceptionType.unknown:
        if (e.error is FormatException) {
          return NewsError.parsing();
        }
        return NewsError.unknown();
    }
  }
}

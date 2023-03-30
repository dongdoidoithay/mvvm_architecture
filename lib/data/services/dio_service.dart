import 'package:dio/dio.dart';

/* class DioService {
  Dio createDio() {
    final dio = Dio();
    dio.options.baseUrl = 'https://jsonplaceholder.typicode.com';
    dio.options.connectTimeout = const Duration(seconds: 5); // 5 seconds
    dio.options.receiveTimeout = const Duration(seconds: 3); // 3 seconds
    dio.interceptors.add(LogInterceptor());
    return dio;
  }
}
 */

class DioService {
  final Dio _dio = Dio();

  DioService() {
    _dio.options.baseUrl = 'https://jsonplaceholder.typicode.com';
    _dio.options.connectTimeout = const Duration(seconds: 5); // 5 seconds
    _dio.options.receiveTimeout = const Duration(seconds: 3); // 3 seconds
    _dio.interceptors.add(LogInterceptor());
  }

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
      );
      print('rp: $response');
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(String path, {dynamic data}) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> put(String path, {dynamic data}) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete(String path) async {
    try {
      final response = await _dio.delete(path);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

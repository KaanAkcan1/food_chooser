import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;

  DioClient(this.dio);

  void addInterceptors() {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // TO DO : Token çekeceğiz
        options.headers['Authorization'] = 'Bearer YOUR_TOKEN';
        return handler.next(options);
      },
      onError: (DioException error, handler) {
        // TO DO : Burada refresh token hallederiz
        return handler.next(error);
      },
    ));
  }

  // GET İsteği
  Future<T> get<T>(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.get(path, queryParameters: queryParameters);
      return _handleResponse<T>(response);
    } catch (e) {
      rethrow;
    }
  }

  // POST İsteği
  Future<T> post<T>(String path, Map<String, dynamic> data) async {
    try {
      final response = await dio.post(path, data: data);
      return _handleResponse<T>(response);
    } catch (e) {
      rethrow;
    }
  }

  // PUT İsteği
  Future<T> put<T>(String path, Map<String, dynamic> data) async {
    try {
      final response = await dio.put(path, data: data);
      return _handleResponse<T>(response);
    } catch (e) {
      rethrow;
    }
  }

  // DELETE İsteği
  Future<T> delete<T>(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.delete(path, queryParameters: queryParameters);
      return _handleResponse<T>(response);
    } catch (e) {
      rethrow;
    }
  }

  // API Yanıtını işleme
  T _handleResponse<T>(Response response) {
    final statusCode = response.statusCode;
    final success = statusCode! >= 200 && statusCode < 300;
    final message = response.data['message'] ?? 'Success';

    if (success) {
      return response.data['data'];
    } else {
      throw Exception('Error: $message');
    }
  }
}

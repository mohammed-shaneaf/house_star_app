import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? _dio;

  static Future<Dio> getDio({String? token}) async {
    const timeout = Duration(seconds: 30);

    if (_dio == null) {
      final dio = Dio(
        BaseOptions(
          connectTimeout: timeout,
          receiveTimeout: timeout,
          sendTimeout: timeout,
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            if (token != null) 'Authorization': 'Bearer $token',
          },
        ),
      );

      dio.interceptors.addAll([
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
        InterceptorsWrapper(
          onError: (DioException e, handler) {
            return handler.next(e);
          },
        ),
      ]);

      _dio = dio;
      return dio;
    }

    if (token != null) {
      _dio!.options.headers['Authorization'] = 'Bearer $token';
    }

    return _dio!;
  }
}

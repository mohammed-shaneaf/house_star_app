// /// Logging interceptor for Dio
// /// 
// /// WHY: Logs all HTTP requests and responses for debugging.
// /// Makes it easy to see what's being sent to/from the API.
// /// 
// /// HOW IT INTEGRATES: Added to Dio instance in DioFactory when logging is enabled.
// /// Uses LoggingService to output formatted request/response data.
// /// 
// /// ARCHITECTURE: Development tool for debugging API communication.
// /// Only enabled in development builds.
// /// 
// /// USAGE:
// /// ```dart
// /// dio.interceptors.add(LoggingInterceptor(logger));
// /// ```

// import 'package:dio/dio.dart';


// class LoggingInterceptor extends Interceptor {




//   @override
//   void onRequest(
//     RequestOptions options,
//     RequestInterceptorHandler handler,
//   ) {
//   .debug(
//       '🌐 REQUEST[${options.method}] => ${options.uri}\n'
//       'Headers: ${options.headers}\n'
//       'Body: ${options.data}',
//     );
//     handler.next(options);
//   }

//   @override
//   void onResponse(
//     Response response,
//     ResponseInterceptorHandler handler,
//   ) {
//     _logger.debug(
//       '✅ RESPONSE[${response.statusCode}] => ${response.requestOptions.uri}\n'
//       'Data: ${response.data}',
//     );
//     handler.next(response);
//   }

//   @override
//   void onError(
//     DioException err,
//     ErrorInterceptorHandler handler,
//   ) {
//     _logger.error(
//       '❌ ERROR[${err.response?.statusCode}] => ${err.requestOptions.uri}\n'
//       'Message: ${err.message}\n'
//       'Response: ${err.response?.data}',
//     );
//     handler.next(err);
//   }
// }

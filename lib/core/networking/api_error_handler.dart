// /// Centralized API error handling
// /// 
// /// WHY: Converts low-level HTTP errors (DioException) into domain-level Failures.
// /// This decouples the domain layer from infrastructure concerns.
// /// 
// /// HOW IT INTEGRATES: Used by repositories to handle API errors.
// /// When a Dio request fails, this handler converts it to a Failure object
// /// that the domain layer can understand.
// /// 
// /// ARCHITECTURE: Part of the data layer. Bridges infrastructure (Dio)
// /// and domain (Failure) layers.
// /// 
// /// USAGE:
// /// ```dart
// /// try {
// ///   final response = await apiService.getUser(id);
// ///   return ApiResult.success(response);
// /// } on DioException catch (e) {
// ///   final failure = ApiErrorHandler.handle(e);
// ///   return ApiResult.failure(failure);
// /// }
// /// ```

// import 'package:dio/dio.dart';
// import '../error/failure.dart';
// import 'api_error_model.dart';
// import 'api_constants.dart';

// class ApiErrorHandler {
//   // Private constructor to prevent instantiation
//   ApiErrorHandler._();

//   /// Handle DioException and convert to Failure
//   static Failure handle(DioException error) {
//     switch (error.type) {
//       case DioExceptionType.connectionTimeout:
//       case DioExceptionType.sendTimeout:
//       case DioExceptionType.receiveTimeout:
//         return const Failure.network(
//           message: 'Connection timeout. Please check your internet connection.',
//         );

//       case DioExceptionType.badResponse:
//         return _handleResponseError(error.response);

//       case DioExceptionType.cancel:
//         return const Failure.network(
//           message: 'Request was cancelled',
//         );

//       case DioExceptionType.connectionError:
//         return const Failure.network(
//           message: 'No internet connection. Please check your network.',
//         );

//       case DioExceptionType.badCertificate:
//         return const Failure.network(
//           message: 'Security certificate error',
//         );

//       case DioExceptionType.unknown:
//       default:
//         return Failure.network(
//           message: error.message ?? 'An unexpected error occurred',
//         );
//     }
//   }

//   /// Handle HTTP response errors based on status code
//   static Failure _handleResponseError(Response? response) {
//     if (response == null) {
//       return const Failure.server(
//         message: 'No response from server',
//       );
//     }

//     final statusCode = response.statusCode ?? 0;

//     // Try to parse error model from response
//     ApiErrorModel? errorModel;
//     try {
//       if (response.data is Map<String, dynamic>) {
//         errorModel = ApiErrorModel.fromJson(response.data);
//       }
//     } catch (_) {
//       // Ignore parsing errors
//     }

//     final message = errorModel?.displayMessage ?? _getDefaultMessage(statusCode);

//     switch (statusCode) {
//       case ApiConstants.statusBadRequest:
//         return Failure.validation(
//           message: errorModel?.validationErrorsMessage ?? message,
//         );

//       case ApiConstants.statusUnauthorized:
//         return const Failure.unauthorized(
//           message: 'Session expired. Please login again.',
//         );

//       case ApiConstants.statusForbidden:
//         return const Failure.forbidden(
//           message: 'You don\'t have permission to access this resource.',
//         );

//       case ApiConstants.statusNotFound:
//         return Failure.notFound(
//           message: message,
//         );

//       case ApiConstants.statusServerError:
//       case 502:
//       case 503:
//         return Failure.server(
//           message: message,
//         );

//       default:
//         return Failure.server(
//           message: message,
//         );
//     }
//   }

//   /// Get default error message based on status code
//   static String _getDefaultMessage(int statusCode) {
//     switch (statusCode) {
//       case 400:
//         return 'Invalid request';
//       case 401:
//         return 'Unauthorized access';
//       case 403:
//         return 'Access forbidden';
//       case 404:
//         return 'Resource not found';
//       case 500:
//         return 'Internal server error';
//       case 502:
//         return 'Bad gateway';
//       case 503:
//         return 'Service unavailable';
//       default:
//         return 'Something went wrong';
//     }
//   }
// }

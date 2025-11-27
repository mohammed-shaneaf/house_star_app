// /// Authentication interceptor for Dio
// /// 
// /// WHY: Automatically adds authentication tokens to all API requests.
// /// Also handles token refresh and 401 (unauthorized) responses.
// /// 
// /// HOW IT INTEGRATES: Added to Dio instance in DioFactory.
// /// Reads tokens from StorageService and adds them to request headers.
// /// 
// /// ARCHITECTURE: Part of the networking infrastructure.
// /// Bridges authentication state (stored tokens) with API requests.
// /// 
// /// USAGE:
// /// ```dart
// /// dio.interceptors.add(AuthInterceptor(storage));
// /// ```

// import 'package:dio/dio.dart';

// import '../networking/api_constants.dart';

// class AuthInterceptor extends Interceptor {
//   final StorageService _storage;

//   AuthInterceptor(this._storage);

//   @override
//   void onRequest(
//     RequestOptions options,
//     RequestInterceptorHandler handler,
//   ) async {
//     // Get access token from storage
//     final token = await _storage.getAccessToken();

//     // Add token to headers if it exists
//     if (token != null && token.isNotEmpty) {
//       options.headers[ApiConstants.authorizationHeader] =
//           '${ApiConstants.bearerPrefix} $token';
//     }

//     // Continue with the request
//     handler.next(options);
//   }

//   @override
//   void onError(
//     DioException err,
//     ErrorInterceptorHandler handler,
//   ) async {
//     // Handle 401 Unauthorized - token expired
//     if (err.response?.statusCode == ApiConstants.statusUnauthorized) {
//       // Try to refresh token
//       final refreshed = await _attemptTokenRefresh(err.requestOptions);

//       if (refreshed) {
//         // Retry the original request with new token
//         try {
//           final response = await _retry(err.requestOptions);
//           handler.resolve(response);
//           return;
//         } catch (e) {
//           // If retry fails, continue with error
//         }
//       }

//       // If refresh failed, clear tokens and continue with error
//       await _storage.clearTokens();
//     }

//     // Continue with error
//     handler.next(err);
//   }

//   /// Attempt to refresh the access token
//   Future<bool> _attemptTokenRefresh(RequestOptions options) async {
//     try {
//       final refreshToken = await _storage.getRefreshToken();
//       if (refreshToken == null || refreshToken.isEmpty) {
//         return false;
//       }

//       // TODO: Implement token refresh API call
//       // This should call your refresh token endpoint
//       // For now, return false
//       return false;
//     } catch (e) {
//       return false;
//     }
//   }

//   /// Retry a request with updated token
//   Future<Response> _retry(RequestOptions requestOptions) async {
//     final dio = Dio();
    
//     // Get new token
//     final token = await _storage.getAccessToken();
//     if (token != null) {
//       requestOptions.headers[ApiConstants.authorizationHeader] =
//           '${ApiConstants.bearerPrefix} $token';
//     }

//     // Retry the request
//     return dio.fetch(requestOptions);
//   }
// }

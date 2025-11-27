/// API endpoint constants and HTTP configuration
/// 
/// WHY: Centralizes all API endpoints and HTTP-related constants.
/// This makes it easy to update endpoints and avoid magic strings.
/// 
/// HOW IT INTEGRATES: Used by ApiService and feature repositories
/// to construct API requests.
/// 
/// USAGE:
/// ```dart
/// @GET(ApiConstants.login)
/// Future<LoginResponse> login(@Body() LoginRequest request);
/// ```

class ApiConstants {
  // Private constructor to prevent instantiation
  ApiConstants._();

  // API Version
  static const String apiVersion = 'v1';

  // Authentication Endpoints
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String logout = '/auth/logout';
  static const String refreshToken = '/auth/refresh';
  static const String forgotPassword = '/auth/forgot-password';
  static const String resetPassword = '/auth/reset-password';
  static const String verifyEmail = '/auth/verify-email';

  // User Endpoints
  static const String profile = '/user/profile';
  static const String updateProfile = '/user/profile';
  static const String changePassword = '/user/change-password';
  static const String deleteAccount = '/user/delete';

  // Property Endpoints
  static const String properties = '/properties';
  static const String propertyDetails = '/properties/{id}';
  static const String createProperty = '/properties';
  static const String updateProperty = '/properties/{id}';
  static const String deleteProperty = '/properties/{id}';
  static const String searchProperties = '/properties/search';
  static const String featuredProperties = '/properties/featured';

  // Favorites Endpoints
  static const String favorites = '/favorites';
  static const String addFavorite = '/favorites';
  static const String removeFavorite = '/favorites/{id}';

  // Upload Endpoints
  static const String uploadImage = '/upload/image';
  static const String uploadDocument = '/upload/document';

  // HTTP Headers
  static const String authorizationHeader = 'Authorization';
  static const String bearerPrefix = 'Bearer';
  static const String contentTypeHeader = 'Content-Type';
  static const String acceptHeader = 'Accept';

  // HTTP Status Codes
  static const int statusOk = 200;
  static const int statusCreated = 201;
  static const int statusNoContent = 204;
  static const int statusBadRequest = 400;
  static const int statusUnauthorized = 401;
  static const int statusForbidden = 403;
  static const int statusNotFound = 404;
  static const int statusServerError = 500;

  // Pagination
  static const String pageParam = 'page';
  static const String limitParam = 'limit';
  static const int defaultPageSize = 20;

  // Storage Keys (for tokens, etc.)
  static const String accessTokenKey = 'access_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String userIdKey = 'user_id';
}

/// Retrofit API service interface
/// 
/// WHY: Provides a type-safe HTTP client using Retrofit.
/// Retrofit generates implementation code, reducing boilerplate and errors.
/// 
/// HOW IT INTEGRATES: Registered in DI container and injected into repositories.
/// Feature repositories extend or use this service to make API calls.
/// 
/// ARCHITECTURE: This is the main HTTP client for the data layer.
/// Repositories use this to fetch data from the API.
/// 
/// CODE GENERATION: Run `flutter pub run build_runner build` to generate api_service.g.dart
/// 
/// USAGE:
/// ```dart
/// final apiService = getIt<ApiService>();
/// final response = await apiService.login(loginRequest);
/// ```

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'api_constants.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;

  // ==================== Authentication ====================
  
  @POST(ApiConstants.login)
  Future<HttpResponse> login(@Body() Map<String, dynamic> body);

  @POST(ApiConstants.register)
  Future<HttpResponse> register(@Body() Map<String, dynamic> body);

  @POST(ApiConstants.logout)
  Future<HttpResponse> logout();

  @POST(ApiConstants.refreshToken)
  Future<HttpResponse> refreshToken(@Body() Map<String, dynamic> body);

  @POST(ApiConstants.forgotPassword)
  Future<HttpResponse> forgotPassword(@Body() Map<String, dynamic> body);

  @POST(ApiConstants.resetPassword)
  Future<HttpResponse> resetPassword(@Body() Map<String, dynamic> body);

  // ==================== User Profile ====================
  
  @GET(ApiConstants.profile)
  Future<HttpResponse> getProfile();

  @PUT(ApiConstants.updateProfile)
  Future<HttpResponse> updateProfile(@Body() Map<String, dynamic> body);

  @POST(ApiConstants.changePassword)
  Future<HttpResponse> changePassword(@Body() Map<String, dynamic> body);

  // ==================== Properties ====================
  
  @GET(ApiConstants.properties)
  Future<HttpResponse> getProperties({
    @Query(ApiConstants.pageParam) int? page,
    @Query(ApiConstants.limitParam) int? limit,
  });

  @GET(ApiConstants.propertyDetails)
  Future<HttpResponse> getPropertyDetails(@Path('id') String id);

  @POST(ApiConstants.createProperty)
  Future<HttpResponse> createProperty(@Body() Map<String, dynamic> body);

  @PUT(ApiConstants.updateProperty)
  Future<HttpResponse> updateProperty(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  @DELETE(ApiConstants.deleteProperty)
  Future<HttpResponse> deleteProperty(@Path('id') String id);

  @GET(ApiConstants.searchProperties)
  Future<HttpResponse> searchProperties({
    @Query('query') String? query,
    @Query('location') String? location,
    @Query('minPrice') double? minPrice,
    @Query('maxPrice') double? maxPrice,
    @Query(ApiConstants.pageParam) int? page,
  });

  @GET(ApiConstants.featuredProperties)
  Future<HttpResponse> getFeaturedProperties();

  // ==================== Favorites ====================
  
  @GET(ApiConstants.favorites)
  Future<HttpResponse> getFavorites();

  @POST(ApiConstants.addFavorite)
  Future<HttpResponse> addFavorite(@Body() Map<String, dynamic> body);

  @DELETE(ApiConstants.removeFavorite)
  Future<HttpResponse> removeFavorite(@Path('id') String id);

  // ==================== File Upload ====================
  
  @POST(ApiConstants.uploadImage)
  @MultiPart()
  Future<HttpResponse> uploadImage(@Part() MultipartFile file);

  @POST(ApiConstants.uploadDocument)
  @MultiPart()
  Future<HttpResponse> uploadDocument(@Part() MultipartFile file);
}

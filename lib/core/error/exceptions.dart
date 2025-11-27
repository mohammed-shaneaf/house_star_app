/// Data layer exception classes
/// 
/// WHY: Represents errors at the data layer (API, cache, database).
/// These are thrown by data sources and caught by repositories.
/// 
/// HOW IT INTEGRATES: Data sources throw these exceptions.
/// Repositories catch them and convert to domain Failures.
/// 
/// ARCHITECTURE: Part of the data layer. These should never reach
/// the domain or presentation layers.
/// 
/// DIFFERENCE FROM FAILURES: Exceptions are for data layer errors.
/// Failures are for domain layer errors. Repositories do the conversion.
/// 
/// USAGE:
/// ```dart
/// // In data source
/// if (response.statusCode != 200) {
///   throw ServerException(message: 'Server error');
/// }
/// 
/// // In repository
/// try {
///   final data = await dataSource.getData();
///   return ApiResult.success(data);
/// } on ServerException catch (e) {
///   return ApiResult.failure(Failure.server(message: e.message));
/// }
/// ```

/// Base exception class
abstract class AppException implements Exception {
  final String message;
  final int? code;

  const AppException({
    required this.message,
    this.code,
  });

  @override
  String toString() => '$runtimeType(message: $message, code: $code)';
}

/// Server exception (5xx errors)
class ServerException extends AppException {
  const ServerException({
    required super.message,
    super.code,
  });
}

/// Network exception (connection errors, timeouts)
class NetworkException extends AppException {
  const NetworkException({
    required super.message,
    super.code,
  });
}

/// Validation exception (400 errors, invalid input)
class ValidationException extends AppException {
  final Map<String, dynamic>? errors;

  const ValidationException({
    required super.message,
    super.code,
    this.errors,
  });

  @override
  String toString() =>
      'ValidationException(message: $message, code: $code, errors: $errors)';
}

/// Unauthorized exception (401 errors)
class UnauthorizedException extends AppException {
  const UnauthorizedException({
    required super.message,
    super.code,
  });
}

/// Forbidden exception (403 errors)
class ForbiddenException extends AppException {
  const ForbiddenException({
    required super.message,
    super.code,
  });
}

/// Not found exception (404 errors)
class NotFoundException extends AppException {
  const NotFoundException({
    required super.message,
    super.code,
  });
}

/// Cache exception (local storage errors)
class CacheException extends AppException {
  const CacheException({
    required super.message,
    super.code,
  });
}

/// Parsing exception (JSON parsing errors)
class ParsingException extends AppException {
  const ParsingException({
    required super.message,
    super.code,
  });
}

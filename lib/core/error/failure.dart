// /// Domain-level failure classes
// ///
// /// WHY: Represents errors in domain terms, not infrastructure terms.
// /// This decouples business logic from implementation details (HTTP, database, etc.).
// ///
// /// HOW IT INTEGRATES: Returned by repositories via ApiResult.
// /// Use cases and Cubits handle these failures to show appropriate UI.
// ///
// /// ARCHITECTURE: Part of the domain layer. These are the only error types
// /// that use cases and presentation layer should know about.
// ///
// /// DIFFERENCE FROM EXCEPTIONS: Exceptions are for data layer (ServerException, CacheException).
// /// Failures are for domain layer (NetworkFailure, ServerFailure).
// /// Repositories convert Exceptions to Failures.
// ///
// /// USAGE:
// /// ```dart
// /// // In repository
// /// return ApiResult.failure(Failure.network(message: 'No connection'));
// ///
// /// // In Cubit
// /// result.when(
// ///   success: (data) => emit(SuccessState(data)),
// ///   failure: (failure) => emit(ErrorState(failure.message)),
// /// );
// /// ```

// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'failure.freezed.dart';

// @freezed
// class Failure with _$Failure {
//   /// Network-related failures (no internet, timeout, etc.)
//   const factory Failure.network({required String message}) = NetworkFailure;

//   /// Server-related failures (5xx errors, server down, etc.)
//   const factory Failure.server({required String message}) = ServerFailure;

//   /// Validation failures (400 errors, invalid input, etc.)
//   const factory Failure.validation({required String message}) =
//       ValidationFailure;

//   /// Unauthorized failures (401 errors, token expired, etc.)
//   const factory Failure.unauthorized({required String message}) =
//       UnauthorizedFailure;

//   /// Forbidden failures (403 errors, no permission, etc.)
//   const factory Failure.forbidden({required String message}) = ForbiddenFailure;

//   /// Not found failures (404 errors, resource doesn't exist, etc.)
//   const factory Failure.notFound({required String message}) = NotFoundFailure;

//   /// Cache-related failures (local storage errors, etc.)
//   const factory Failure.cache({required String message}) = CacheFailure;

//   /// Unexpected failures (unknown errors, etc.)
//   const factory Failure.unexpected({required String message}) =
//       UnexpectedFailure;
// }

// /// Extension methods for Failure
// extension FailureExtension on Failure {
//   /// Get user-friendly message
//   String get displayMessage => when(
//     network: (msg) => msg,
//     server: (msg) => msg,
//     validation: (msg) => msg,
//     unauthorized: (msg) => msg,
//     forbidden: (msg) => msg,
//     notFound: (msg) => msg,
//     cache: (msg) => msg,
//     unexpected: (msg) => msg,
//   );

//   /// Check if failure is network-related
//   bool get isNetworkFailure => this is NetworkFailure;

//   /// Check if failure is unauthorized
//   bool get isUnauthorized => this is UnauthorizedFailure;
// }

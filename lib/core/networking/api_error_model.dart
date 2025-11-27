// /// API error response model
// ///
// /// WHY: Standardizes error response parsing from the API.
// /// Most REST APIs return errors in a consistent JSON format.
// ///
// /// HOW IT INTEGRATES: Used by ApiErrorHandler to parse error responses
// /// from the server and convert them to domain Failure objects.
// ///
// /// ARCHITECTURE: This is part of the data layer. It represents the raw
// /// error format from the API before being transformed to domain Failures.
// ///
// /// USAGE:
// /// ```dart
// /// final errorModel = ApiErrorModel.fromJson(response.data);
// /// print(errorModel.message);
// /// ```

// import 'package:json_annotation/json_annotation.dart';

// part 'api_error_model.g.dart';

// @JsonSerializable()
// class ApiErrorModel {
//   final String? message;
//   final int? code;
//   final String? error;
//   final Map<String, dynamic>? errors; // For validation errors
//   final String? statusCode;

//   const ApiErrorModel({
//     this.message,
//     this.code,
//     this.error,
//     this.errors,
//     this.statusCode,
//   });

//   factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
//       _$ApiErrorModelFromJson(json);

//   Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

//   /// Get a user-friendly error message
//   String get displayMessage {
//     // Priority: message > error > default
//     if (message != null && message!.isNotEmpty) {
//       return message!;
//     }
//     if (error != null && error!.isNotEmpty) {
//       return error!;
//     }
//     return 'An unexpected error occurred';
//   }

//   /// Get validation errors as a formatted string
//   String? get validationErrorsMessage {
//     if (errors == null || errors!.isEmpty) return null;

//     final messages = <String>[];
//     errors!.forEach((field, value) {
//       if (value is List) {
//         messages.addAll(value.map((e) => e.toString()));
//       } else {
//         messages.add(value.toString());
//       }
//     });

//     return messages.join('\n');
//   }

//   @override
//   String toString() {
//     return 'ApiErrorModel(message: $message, code: $code, error: $error)';
//   }
// }

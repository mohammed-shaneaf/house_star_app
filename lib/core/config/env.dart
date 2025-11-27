/// Environment configuration manager
/// 
/// WHY: Provides type-safe access to environment variables defined at compile-time
/// using --dart-define flags. This allows different configurations for dev/staging/prod
/// without hardcoding sensitive values.
/// 
/// HOW IT INTEGRATES: Used by AppConfig to build environment-specific configurations.
/// The main_dev.dart and main_prod.dart files pass different values via --dart-define.
/// 
/// USAGE:
/// ```dart
/// final apiUrl = Env.apiUrl;
/// final environment = Env.environment;
/// ```

class Env {
  // Private constructor to prevent instantiation
  Env._();

  /// Current environment (dev, staging, prod)
  static const String environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: 'dev',
  );

  /// Base API URL
  static const String apiUrl = String.fromEnvironment(
    'API_URL',
    defaultValue: 'https://api.dev.housestar.com',
  );

  /// Application name (can differ per environment)
  static const String appName = String.fromEnvironment(
    'APP_NAME',
    defaultValue: 'HouseStar Dev',
  );

  /// Enable debug logging
  static const bool enableLogging = bool.fromEnvironment(
    'ENABLE_LOGGING',
    defaultValue: true,
  );

  /// API timeout in seconds
  static const int apiTimeout = int.fromEnvironment(
    'API_TIMEOUT',
    defaultValue: 30,
  );

  /// Helper methods
  static bool get isDevelopment => environment == 'dev';
  static bool get isStaging => environment == 'staging';
  static bool get isProduction => environment == 'prod';
}

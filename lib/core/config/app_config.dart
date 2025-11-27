import 'env.dart';

/// Application configuration model
/// 
/// WHY: Centralizes all environment-specific settings in an immutable model.
/// This provides a single source of truth for configuration throughout the app.
/// 
/// HOW IT INTEGRATES: Created during app initialization and injected via DI.
/// Services like DioFactory, ApiService, and LoggingService read from this config.
/// 
/// USAGE:
/// ```dart
/// final config = AppConfig.fromEnvironment();
/// print(config.baseUrl);
/// ```

class AppConfig {
  final String environment;
  final String baseUrl;
  final String appName;
  final bool enableLogging;
  final int apiTimeoutSeconds;
  final bool enableAnalytics;

  const AppConfig({
    required this.environment,
    required this.baseUrl,
    required this.appName,
    required this.enableLogging,
    required this.apiTimeoutSeconds,
    required this.enableAnalytics,
  });

  /// Factory constructor to create config from environment variables
  factory AppConfig.fromEnvironment() {
    return AppConfig(
      environment: Env.environment,
      baseUrl: Env.apiUrl,
      appName: Env.appName,
      enableLogging: Env.enableLogging,
      apiTimeoutSeconds: Env.apiTimeout,
      enableAnalytics: Env.isProduction,
    );
  }

  /// Development configuration
  factory AppConfig.development() {
    return const AppConfig(
      environment: 'dev',
      baseUrl: 'https://api.dev.housestar.com',
      appName: 'HouseStar Dev',
      enableLogging: true,
      apiTimeoutSeconds: 30,
      enableAnalytics: false,
    );
  }

  /// Production configuration
  factory AppConfig.production() {
    return const AppConfig(
      environment: 'prod',
      baseUrl: 'https://api.housestar.com',
      appName: 'HouseStar',
      enableLogging: false,
      apiTimeoutSeconds: 30,
      enableAnalytics: true,
    );
  }

  bool get isDevelopment => environment == 'dev';
  bool get isProduction => environment == 'prod';

  @override
  String toString() {
    return 'AppConfig(environment: $environment, baseUrl: $baseUrl)';
  }
}

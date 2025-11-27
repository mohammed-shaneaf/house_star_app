// /// Dependency Injection container using GetIt + Injectable
// /// 
// /// WHY: Centralizes service registration and dependency management.
// /// Using injectable package for code generation reduces boilerplate and errors.
// /// 
// /// HOW IT INTEGRATES: Called during app initialization in main.dart.
// /// All services (Dio, ApiService, Repositories, Cubits) are registered here.
// /// Access dependencies anywhere via: getIt<ServiceType>()
// /// 
// /// CODE GENERATION: Run `flutter pub run build_runner build` to generate injector.config.dart
// /// 
// /// USAGE:
// /// ```dart
// /// // Register dependencies
// /// await configureDependencies(config);
// /// 
// /// // Access dependencies
// /// final apiService = getIt<ApiService>();
// /// final logger = getIt<LoggingService>();
// /// ```

// import 'package:get_it/get_it.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:logger/logger.dart';

// import '../config/app_config.dart';
// import '../networking/dio_factory.dart';
// import '../networking/api_service.dart';
// import '../services/logging_service.dart';
// import '../services/analytics_service.dart';
// import '../services/storage_service.dart';
// import '../services/preferences_service.dart';

// // GetIt instance - global service locator
// final getIt = GetIt.instance;

// /// Configure and register all dependencies
// /// 
// /// This function is called during app initialization.
// /// It registers all core services in the correct order (dependencies first).
// Future<void> configureDependencies(AppConfig config) async {
//   // Register configuration
//   getIt.registerSingleton<AppConfig>(config);

//   // Register core services
//   await _registerCoreServices();

//   // Register networking
//   _registerNetworking();

//   // TODO: Register repositories (will be added when features are created)
//   // TODO: Register use cases (will be added when features are created)
//   // TODO: Register cubits/blocs (will be added when features are created)
// }

// /// Register core services (Logger, Storage, Preferences, Analytics)
// Future<void> _registerCoreServices() async {
//   // Logger
//   final logger = Logger(
//     printer: PrettyPrinter(
//       methodCount: 0,
//       errorMethodCount: 5,
//       lineLength: 50,
//       colors: true,
//       printEmojis: true,
//     ),
//   );
//   getIt.registerSingleton<Logger>(logger);
//   getIt.registerSingleton<LoggingService>(LoggingService(logger));

//   // Secure Storage
//   const secureStorage = FlutterSecureStorage(
//     aOptions: AndroidOptions(encryptedSharedPreferences: true),
//   );
//   getIt.registerSingleton<FlutterSecureStorage>(secureStorage);
//   getIt.registerSingleton<StorageService>(StorageService(secureStorage));

//   // Shared Preferences
//   final prefs = await SharedPreferences.getInstance();
//   getIt.registerSingleton<SharedPreferences>(prefs);
//   getIt.registerSingleton<PreferencesService>(PreferencesService(prefs));

//   // Analytics
//   getIt.registerSingleton<AnalyticsService>(AnalyticsService());
// }

// /// Register networking services (Dio, ApiService)
// void _registerNetworking() {
//   final config = getIt<AppConfig>();
//   final logger = getIt<LoggingService>();
//   final storage = getIt<StorageService>();

//   // Create Dio instance
//   final dio = DioFactory.create(
//     baseUrl: config.baseUrl,
//     timeout: Duration(seconds: config.apiTimeoutSeconds),
//     enableLogging: config.enableLogging,
//     logger: logger,
//     storage: storage,
//   );
//   getIt.registerSingleton<Dio>(dio);

//   // Register API Service
//   final apiService = ApiService(dio);
//   getIt.registerSingleton<ApiService>(apiService);
// }

// /// Reset all dependencies (useful for testing)
// Future<void> resetDependencies() async {
//   await getIt.reset();
// }

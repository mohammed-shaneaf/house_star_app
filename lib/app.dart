/// Root application widget
///
/// WHY: Centralizes MaterialApp configuration including routing, theming,
/// and localization. Separating this from main.dart keeps entry points clean.
///
/// HOW IT INTEGRATES: Instantiated by all main entry points (main.dart, main_dev.dart, main_prod.dart).
/// Uses AppRouter for navigation, AppTheme for styling, and flutter_localization for i18n.
///
/// ARCHITECTURE: This is the root of the widget tree. All features and screens
/// are children of this widget, accessed via the routing system.

import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'core/routing/app_router.dart';
import 'core/styles/app_theme.dart';

class HouseStarApp extends StatefulWidget {
  const HouseStarApp({super.key});

  @override
  State<HouseStarApp> createState() => _HouseStarAppState();
}

class _HouseStarAppState extends State<HouseStarApp> {
  final FlutterLocalization _localization = FlutterLocalization.instance;

  @override
  void initState() {
    super.initState();
    _configureLocalization();
  }

  void _configureLocalization() {
    _localization.init(
      mapLocales: [
        // const MapLocale('en', AppLocale.EN),
        // const MapLocale('ar', AppLocale.AR),
      ],
      initLanguageCode: 'en',
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HouseStar',
      debugShowCheckedModeBanner: false,

      // Theming
      // theme: AppTheme.lightTheme,
      // darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,

      // Localization
      supportedLocales: _localization.supportedLocales,
      localizationsDelegates: _localization.localizationsDelegates,

      // Routing
      // initialRoute: AppRouter.splash,
      // onGenerateRoute: AppRouter.generateRoute,
    );
  }
}

/// Locale mappings for flutter_localization
/// These correspond to the .arb files in lib/l10n/
mixin AppLocale {
  static const String EN = 'en';
  static const String AR = 'ar';
}

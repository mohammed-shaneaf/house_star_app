/// Default entry point - delegates to development environment
///
/// WHY: Provides a simple default entry point for development.
/// When running without --dart-define flags, this uses dev configuration.
///
/// HOW IT INTEGRATES: Imports and calls the bootstrap function which
/// initializes dependency injection, error handling, and runs the app.

import 'package:flutter/material.dart';
import 'package:house_star_app/house_star_app.dart';

import 'app.dart';

void main() async {
  runApp(const HouseStarApp());
}

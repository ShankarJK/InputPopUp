// ignore_for_file: constant_identifier_names, unused_import

import '../../Pages/HomeScreen/HomeScreen.dart';
import 'NavigationHelpers.dart';

// Declare a enum named Routes and assign the constant values
enum Routes { HomeScreen }

class Pages {
  Object? data;

  // Create a PageConfig for homeScreenConfig
  static final PageConfig homeScreenConfig =
      PageConfig(route: Routes.HomeScreen, build: (context) => HomeScreen());
}

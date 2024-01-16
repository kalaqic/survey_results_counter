import 'package:flutter/material.dart';
import 'package:brojac_glasova/screens/info_screen.dart';
import 'package:brojac_glasova/screens/landing/landing.dart';
import 'package:brojac_glasova/screens/loader/loading.dart';

class Routes {
  static Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    '/loading': (context) => const LoadingScreen(),
    '/landing': (context) => const LandingScreen(),
    '/info': (context) => const InfoScreen(),
  };
}

import 'package:apna_store/common/widgets/bottom_bar.dart';
import 'package:apna_store/features/auth/screens/auth_screen.dart';
import 'package:apna_store/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
          builder: (_) => const AuthScreen(), settings: routeSettings);

    case HomeScreen.routeName:
      return MaterialPageRoute(
          builder: (_) => const HomeScreen(), settings: routeSettings);
    case BottomBar.routeName:
      return MaterialPageRoute(
          builder: (_) => const BottomBar(), settings: routeSettings);
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${routeSettings.name}'),
          ),
        ),
      );
  }
}

import 'package:flutter/material.dart';
import 'package:untitled7/screens/login/login.dart';
import 'package:untitled7/screens/nav/bottom_nav.dart';
import 'package:untitled7/screens/random_food/bloc/random_food_bloc.dart';
import 'package:untitled7/screens/random_food/random_food_screen.dart';
import 'package:untitled7/screens/signIn/signIn_screen.dart';

class CustomRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('Route: ${settings.name}');
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          settings: const RouteSettings(name: '/'),
          builder: (_) => const Scaffold(),
        );
      case SignUpScreen.routeName:
        return SignUpScreen.route();
      case LoginScreen.routeName:
        return LoginScreen.route();
      case RandomFoodScreen.routeName:
        return RandomFoodScreen.route();
      case NavScreen.routeName:
        return NavScreen.route();
    }
  }
}

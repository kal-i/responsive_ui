import 'package:flutter/material.dart';
import 'package:responsive_ui/screens/cart_page.dart';
import 'package:responsive_ui/screens/home_page.dart';
import 'package:responsive_ui/screens/undefined_page.dart';
import 'constants/routing_constants.dart';
import 'screens/welcome_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case welcomePageRoute:
      return MaterialPageRoute(builder: (context) => const WelcomePage());
    case homePageRoute:
      return MaterialPageRoute(builder: (context) => const HomePage());
    case cartPageRoute:
      return MaterialPageRoute(builder: (context) => const CartPage());
    default:
      return MaterialPageRoute(builder: (context) => UndefinedPage(name: settings.name));
  }
}
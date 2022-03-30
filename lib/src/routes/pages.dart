import 'package:app_delivery/src/ui/pages/dish/dish_page.dart';
import 'package:app_delivery/src/ui/pages/forgot_password/forgot_password_page.dart';
import 'package:app_delivery/src/ui/pages/home/home_page.dart';
import 'package:app_delivery/src/ui/pages/login/login_page.dart';
import 'package:app_delivery/src/ui/pages/onboard/onboard_page.dart';
import 'package:app_delivery/src/ui/pages/register/register_page.dart';
import 'package:app_delivery/src/ui/pages/welcome/welcome_page.dart';
import 'package:flutter/widgets.dart';
import 'routes.dart';

abstract class Pages {
  static const String INITIAL = Routes.ONBOARD;
  static final Map<String, Widget Function(BuildContext)> routes = {
    Routes.ONBOARD: (_) => OnboardPage(),
    Routes.WELCOME: (_) => WelcomePage(),
    Routes.LOGIN: (_) => LoginPage(),
    Routes.REGISTER: (_) => RegisterPage(),
    Routes.FORGOT_PASSWORD: (_) => ForgotPasswordPage(),
    Routes.HOME: (_) => HomePage(),
    Routes.DISH: (_) => DishPage(),
  };
}

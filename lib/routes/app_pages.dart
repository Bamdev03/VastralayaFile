import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:vastralaya/routes/app_routes.dart';
import 'package:vastralaya/screens/auth_ui/login_view.dart';
import 'package:vastralaya/screens/auth_ui/register_view.dart';
import 'package:vastralaya/screens/splash_screen/splash_view.dart';
import 'package:vastralaya/screens/user_panel/home_view.dart';

class AppPages {
  static var routes = [
    // GetPage(name: AppRoutes.home, page: () => HomeView(), binding: CartControllerBinding()),
    GetPage(name: AppRoutes.register, page: () => RegisterView()),
    GetPage(name: AppRoutes.login, page: () => LoginView()),
    GetPage(name: AppRoutes.splash, page: () => SplashView()),
    GetPage(name: AppRoutes.home, page: () => HomeView()),
  ];
}

import 'package:get/get.dart';
import 'package:momentswrapadmin/core/routes/app_routes.dart';
import 'package:momentswrapadmin/features/auth/views/login_screen.dart';
import 'package:momentswrapadmin/features/dashboard/views/dashboard_screen.dart';
import 'package:momentswrapadmin/features/splash_screen/splash_screen.dart';

class AppPages {
  static const String initial = AppRoutes.loginScreen;
   

  static final routes = [
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => SplashScreen(),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 300),
    ),

      GetPage(
      name: AppRoutes.dashboardScreen,
      page: () => DashboardScreen(),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.loginScreen,
      page: () => LoginScreen(),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 300),
    ),
  ];
}

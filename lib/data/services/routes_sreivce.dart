import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:momentswrapadmin/core/routes/app_routes.dart';

class RoutesSreivce {

  static void toLogin () {
    Get.toNamed(AppRoutes.loginScreen);
  }

   static void toDashboard () {
    Get.toNamed(AppRoutes.dashboardScreen);
  }

  
} 

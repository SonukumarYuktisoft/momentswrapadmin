import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momentswrapadmin/core/routes/app_routes.dart';
import 'package:momentswrapadmin/data/services/shared_preferences_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3),() {
      
    },);
    checkLoginStatus();
    super.initState();
  }
   void checkLoginStatus()async{
      var isLoggedIn = await SharedPreferencesHelper.getIsLoggedIn();
      if(isLoggedIn){
        Get.offAndToNamed(AppRoutes.dashboardScreen);
      }else{
        Get.offAndToNamed(AppRoutes.loginScreen);
      }
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text('Splash Screen'),
      ),
    );
  }
}
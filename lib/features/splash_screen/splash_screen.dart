import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momentswrapadmin/core/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3),() {
      // Navigator.pushReplacementNamed(context, '/login');
      Get.offAllNamed(AppRoutes.dashboardScreen);
    },);
    super.initState();
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
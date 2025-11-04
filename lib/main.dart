import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momentswrapadmin/core/common/pages/not_found_screen.dart';
import 'package:momentswrapadmin/core/routes/app_pages.dart';
import 'package:momentswrapadmin/core/routes/app_routes.dart';
import 'package:toastification/toastification.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
         
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        initialRoute: AppPages.initial,
        getPages: AppPages.routes,
        unknownRoute:GetPage(
          name: AppRoutes.notFoundPage,
           page: () => NotFoundScreen(),
           transition: Transition.fade,
           transitionDuration: const Duration(milliseconds: 500),
           ) ,
        //home: HomePage(),
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
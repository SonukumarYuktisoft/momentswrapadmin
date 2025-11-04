import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:momentswrapadmin/features/auth/controllers/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController _authController = Get.put(AuthController());
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: ElevatedButton(onPressed: () {
              // _authController.login();
              _authController.getProducts();
            }, child: Text("fetch Produces")),
          ), Center(
            child: ElevatedButton(onPressed: () {
              // _authController.login();
              _authController.getProductsId(id: "68c45b8139c4738cbbf85077");
            }, child: Text("fetch Produces")),
          ),

          Obx(
            () {
              return Center(
                child: ElevatedButton(onPressed: () {
                  // _authController.login();
                  _authController.login(email: "sonukumaryuktisoft@gmail.com",password:"sonukumaryuktisoft@gmail.com");
              }, child: _authController.isLoading.value ? CircularProgressIndicator() : Text("login")),
              );
            }
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momentswrapadmin/core/constants/app_size.dart';
import 'package:momentswrapadmin/core/validators/app_validators.dart';
import 'package:momentswrapadmin/features/auth/controllers/auth_controller.dart';

class LoginScreen extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
  final controller = Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Form(
        key: controller.formKey,
        child: Padding(
          padding: const EdgeInsets.all(AppSize.defaultPadding),
          child: Column(
            children: [
              TextFormField(

                controller: controller.emailController,
                validator: AppValidators.validateEmail,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
          
                ),
          
              ),
           const   SizedBox(height: AppSize.padding),
              Obx(
                 () {
                  return TextFormField(
                    controller: controller.passwordController,
                    
                    validator: AppValidators.validatePassword,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(onPressed: () => controller.togglePasswordVisibility(), icon: Icon(
                        controller.isPasswordToggle.value ? Icons.visibility_off : Icons.visibility
                      ),),
                      
                    ),
                    obscureText: controller.isPasswordToggle.value,
                    
                  );
                }
              ),
            const  SizedBox(height: AppSize.padding),
              Obx(
                () {
                  return ElevatedButton(
                    onPressed: () {
                      controller.login(
                        email: controller.emailController.text.trim(),
                        password: controller.passwordController.text.trim(),
                      );
                    },
                    child: controller.isLoading.value ? SizedBox(width: 20, height: 20,
                     child: CircularProgressIndicator()) : Text('Login'),
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
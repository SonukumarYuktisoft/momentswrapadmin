import 'package:dio/src/response.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/route_manager.dart';
import 'package:momentswrapadmin/core/helpers/toast_helper.dart';
import 'package:momentswrapadmin/core/routes/app_routes.dart';
import 'package:momentswrapadmin/data/services/shared_preferences_helper.dart';
import 'package:momentswrapadmin/features/auth/models/shop_shopkeeper_model.dart';
import 'package:momentswrapadmin/features/auth/repo/auth_repo.dart';

class AuthController extends GetxController {
  final AuthRepo _authRepo = AuthRepo();
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ShopShopkeeperModel? shopShopkeeperModel;

  RxBool isLoading = false.obs;

  RxBool isPasswordToggle = true.obs;
  void togglePasswordVisibility() => isPasswordToggle.value = !isPasswordToggle.value;
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  Future<Response?> login({
    required String email,
    required String password,
  }) async {
    try {
      if (!formKey.currentState!.validate()) {
        return null;
      }

      isLoading(true);

      final response = await _authRepo.login(email, password);
      if (response != null &&
          response.data != null &&
          response.data['token'] != null) {
        final data = ShopShopkeeperModel.fromJson(response.data);
        shopShopkeeperModel = data;
        SharedPreferencesHelper.setIsLoggedIn(true);
        SharedPreferencesHelper.setJwtToken(data.token);
        Get.offAndToNamed(AppRoutes.dashboardScreen);
      }
      return response;
    } catch (e) {
      ToastHelper.error(
        'Login failed. Please check your credentials and try again.',
      );
    } finally {
      isLoading(false);
    }
  }
}

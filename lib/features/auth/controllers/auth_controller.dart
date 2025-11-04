import 'dart:math';

import 'package:dio/src/response.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/route_manager.dart';
import 'package:momentswrapadmin/core/helpers/toast_helper.dart';
import 'package:momentswrapadmin/features/auth/repo/auth_repo.dart';

class AuthController extends GetxController {
 final AuthRepo _authRepo =AuthRepo();

 RxBool isLoading= false.obs;
 

  Future<Response?>  login({required String email,required String password}) async{
    try {
      isLoading(true);
       final response = await _authRepo.login(email, password);
     if (response != null && response.statusCode != null && response.statusCode! == 200) {
       ToastHelper.success('Login Successful');
       Get.toNamed('/home');
       return response;
     }else{
       ToastHelper.error('Invalid Credentials');
     }
    } catch (e) {
      print(e);
    }finally{
      isLoading(false);
    }
  }

  Future<Response?> getProducts()async{
      return await _authRepo.getProducts();
  }

    Future<Response?> getProductsId({
      required String id,
    })async{
      return await _authRepo.getProductsId(id: id);
  }
 

}
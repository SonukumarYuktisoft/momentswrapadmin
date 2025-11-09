import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:momentswrapadmin/core/helpers/toast_helper.dart';
import 'package:momentswrapadmin/data/services/api_service.dart';

class AuthRepo {
final  ApiService _apiService = ApiService();

  Future<Response?> login(String email,String password) async{
    try {
       final response = await _apiService.requestPostForApi(
      url: 'https://moment-wrap-backend.vercel.app/api/shopkeeper/login-shopkeeper',
      authToken: false,
      dictParameter:{
        "email":email,
        "password":password
      },
     );
     if (response !=null && response.statusCode == 200) {
      ToastHelper.success(response.data['message']);
        return response;
         
     }else{

      ToastHelper.error("Something went wrong!");
      return null;

     }
     
    } catch (e) {
      log('error',name:e.toString());

    }
    
  }

  Future<Response?> getProducts() async{
    return await _apiService.requestGetForApi(
      url:'https://moment-wrap-backend.vercel.app/api/customer/list-all-products',
      authToken:false,
      dictParameter:null,
    );
  }

   Future<Response?> getProductsId({
    required String id,
   }) async{
    return await _apiService.requestGetForApi(
      url:'https://moment-wrap-backend.vercel.app/api/customer/get-product-details/$id',
      authToken:false,
      dictParameter:null,
    );
  }
}
import 'package:dio/dio.dart';
import 'package:momentswrapadmin/data/services/api_service.dart';

class AuthRepo {
final  ApiService _apiService = ApiService();

  Future<Response?> login(String email,String password) async{
    
    return await _apiService.requestPostForApi(
      url: 'https://moment-wrap-backend.vercel.app/api/customer/login-customer',
      authToken: false,
      dictParameter:{
        "email":email,
        "password":password
      },
     );
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
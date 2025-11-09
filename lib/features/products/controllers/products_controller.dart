import 'package:dio/src/response.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:momentswrapadmin/features/products/repo/products_repo.dart';

class ProductsController extends GetxController {
  final ProductsRepo _productsRepo = ProductsRepo();

  Future<Response?> getProducts() async {
    return await _productsRepo.getProducts();
  }

  Future<Response?> getProductsId({required String id}) async {
    return await _productsRepo.getProductsId(id: id);
  }
}
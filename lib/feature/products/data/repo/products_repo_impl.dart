import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:elevate_filtration_task/core/services/api_service.dart';
import '/feature/products/data/models/product_model.dart';

import 'products_repo.dart';

class ProductsRepoImpl extends ProductsRepo {
  final ApiService apiService=.new();
  @override
  Future<Either<String, List<ProductModel>>> getProductsList() async {
    try {
      log('error 1');
      var data = await apiService.get(endPoint: 'products');
      List<ProductModel> productsList = [];
      log('error 2');
      for (var donateCase in data) {
        productsList.add(ProductModel.fromJson(donateCase));
      }
      log('error 3');
      return Right(productsList);
    } catch (e) {
      return Left(e.toString());
    }
  }
}

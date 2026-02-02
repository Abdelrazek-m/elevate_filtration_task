import 'dart:developer';

import 'package:dartz/dartz.dart';
import '/core/services/api_service.dart';
import '/feature/products/data/models/product_model.dart';

import 'products_repo.dart';

class ProductsRepoImpl extends ProductsRepo {
  final ApiService apiService = .new();
  @override
  Future<Either<String, List<ProductModel>>> getProductsList() async {
    try {
      var data = await apiService.get(endPoint: 'products');
      List<ProductModel> productsList = [];
      for (var product in data) {
        try {
          productsList.add(ProductModel.fromJson(product));
        } catch (e) {
          log('\n\n$e\n\n');
          log(product.toString());
        }
      }
      return Right(productsList);
    } catch (e) {
      return Left(e.toString());
    }
  }
}

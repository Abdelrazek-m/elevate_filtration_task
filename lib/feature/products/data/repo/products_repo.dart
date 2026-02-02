import '../models/product_model.dart';

abstract class ProductsRepo {
  Future<List<ProductModel>> getProductsList();
}

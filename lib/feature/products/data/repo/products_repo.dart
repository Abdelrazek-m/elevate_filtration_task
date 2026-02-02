import 'package:dartz/dartz.dart';

import '../models/product_model.dart';

abstract class ProductsRepo {
Future<Either<String, List<ProductModel>>>  getProductsList();
}

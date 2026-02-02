
import 'package:elevate_filtration_task/feature/products/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;

import '/feature/products/data/repo/products_repo.dart';
part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepo productsRepo;
  ProductsCubit(this.productsRepo) : super(ProductsInitialState());

  Future<void> getProducts() async {
    emit(ProductsLoadingState());

    var result = await productsRepo.getProductsList();
    result.fold(
      (errorMessage) {
        emit(ProductsFailureState(errorMessage: errorMessage));
      },
      (productsList) {
        emit(ProductsLoadedState(productsList: productsList));
      },
    );
  }
}

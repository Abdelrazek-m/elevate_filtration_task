import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/feature/products/presentation/view_model/cubit/products_cubit.dart';
import '../widgets/product_card.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

   
  @override
  Widget build(BuildContext context) {
     BlocProvider.of<ProductsCubit>(context).getProducts();
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoadedState) {
          return Scaffold(
            body: GridView.builder(
              padding: EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 4 / 5,
              ),
              itemCount: state.productsList.length,
              itemBuilder: (context, index) =>
                  ProductCard(productData: state.productsList[index]),
            ),
          );
        } else if (state is ProductsFailureState) {
          return Scaffold(body: Text("can't load data"));
        } else {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}

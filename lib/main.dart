import '/feature/products/data/repo/products_repo_impl.dart';
import '/feature/products/presentation/view_model/cubit/products_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature/products/presentation/view/products_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductsCubit(ProductsRepoImpl()),

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Elevate Filtration Task Solve',
        home: ProductsPage(),
      ),
    );
  }
}

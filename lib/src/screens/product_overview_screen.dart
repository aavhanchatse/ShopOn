import 'package:flutter/material.dart';
import 'package:shopon/src/widgets/products_grid.dart';

class ProductOverviewScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ShopOn'),
        centerTitle: true,
      ),
      body: ProductGrid(),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopon/src/providers/product_provider.dart';
import 'package:shopon/src/widgets/product_item.dart';

class ProductGrid extends StatelessWidget {
  final bool showFav;

  ProductGrid(this.showFav);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductProvider>(context);
    final products = showFav ? productsData.favItems : productsData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: products.length,
      itemBuilder: (context, i) => ChangeNotifierProvider.value(
        // create: (context) => products[i],
        value: products[i],
        child: ProductItem(
            // products[i].id,
            // products[i].title,
            // products[i].imageUrl,
            ),
      ),
    );
  }
}

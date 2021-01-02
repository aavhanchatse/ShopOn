import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopon/src/providers/product_provider.dart';
import 'package:shopon/src/screens/edit_product_screen.dart';

import 'package:shopon/src/widgets/main_drawer.dart';
import 'package:shopon/src/widgets/user_product_item.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-product-screen';

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: productData.items.length,
          itemBuilder: (context, index) => Column(
            children: [
              UserProductItem(
                id: productData.items[index].id,
                title: productData.items[index].title,
                imageUrl: productData.items[index].imageUrl,
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}

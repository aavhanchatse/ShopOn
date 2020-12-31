import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shopon/src/providers/cart.dart';
import 'package:shopon/src/screens/cart_screen.dart';

import 'package:shopon/src/widgets/badge.dart';
import 'package:shopon/src/widgets/products_grid.dart';

enum FilterOptions {
  Favourites,
  All,
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFav = false;

  @override
  Widget build(BuildContext context) {
    // final productsContainer = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ShopOn'),
        actions: [
          Consumer<Cart>(
            builder: (context, value, child) => Badge(
              child: child,
              value: value.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favourites) {
                  // productsContainer.showFavOnly();
                  _showOnlyFav = true;
                } else {
                  // productsContainer.showAll();
                  _showOnlyFav = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text('Show Fav'),
                // value: 0,
                value: FilterOptions.Favourites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                // value: 1,
                value: FilterOptions.All,
              ),
            ],
          ),
        ],
        centerTitle: true,
      ),
      body: ProductGrid(_showOnlyFav),
    );
  }
}

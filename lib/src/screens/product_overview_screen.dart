import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shopon/src/providers/cart.dart';
import 'package:shopon/src/providers/product_provider.dart';
import 'package:shopon/src/screens/cart_screen.dart';

import 'package:shopon/src/widgets/badge.dart';
import 'package:shopon/src/widgets/main_drawer.dart';
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
  var _init = true;
  var _isLoading = false;

  @override
  void initState() {
    // Provider.of<ProductProvider>(context).fetchProduct();

    // Future.delayed(Duration.zero).then((value) {
    //   Provider.of<ProductProvider>(context).fetchProduct();
    // });

    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_init) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<ProductProvider>(context).fetchProduct().then((value) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _init = false;
    super.didChangeDependencies();
  }

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
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ProductGrid(_showOnlyFav),
      drawer: MainDrawer(),
    );
  }
}

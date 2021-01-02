import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopon/src/providers/cart.dart';
import 'package:shopon/src/providers/orders.dart';
import 'package:shopon/src/providers/product_provider.dart';

import 'package:shopon/src/screens/cart_screen.dart';
import 'package:shopon/src/screens/edit_product_screen.dart';
import 'package:shopon/src/screens/order_screen.dart';
import 'package:shopon/src/screens/product_details_screen.dart';
import 'package:shopon/src/screens/product_overview_screen.dart';
import 'package:shopon/src/screens/user_products_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
          // value: ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        ),
      ],
      child: MaterialApp(
        title: 'ShopOn',
        theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato'),
        initialRoute: '/',
        routes: {
          '/': (context) => ProductOverviewScreen(),
          ProductDetailsScreen.routeName: (context) => ProductDetailsScreen(),
          CartScreen.routeName: (context) => CartScreen(),
          OrderScreen.routeName: (context) => OrderScreen(),
          UserProductsScreen.routeName: (context) => UserProductsScreen(),
          EditProductScreen.routeName: (context) => EditProductScreen(),
        },
      ),
    );
  }
}

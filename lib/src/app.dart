import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopon/src/helpers/custom_route.dart';
import 'package:shopon/src/providers/auth.dart';

import 'package:shopon/src/providers/cart.dart';
import 'package:shopon/src/providers/orders.dart';
import 'package:shopon/src/providers/product_provider.dart';
import 'package:shopon/src/screens/splash_screen.dart';
import 'package:shopon/src/screens/auth_screen.dart';

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
          create: (context) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, ProductProvider>(
          update: (context, auth, previousProducts) => ProductProvider(
            auth.token,
            auth.userId,
            previousProducts == null ? [] : previousProducts.items,
          ),
          create: null,
          // value: ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
          update: (context, auth, prevOrders) => Orders(
            auth.token,
            prevOrders == null ? [] : prevOrders.orders,
            auth.userId,
          ),
          create: null,
        ),
      ],
      child: Consumer<Auth>(
        builder: (context, auth, child) => MaterialApp(
          title: 'ShopOn',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
            pageTransitionsTheme: PageTransitionsTheme(
              builders: {
                TargetPlatform.android: CustomPageTransitionBuilder(),
                TargetPlatform.iOS: CustomPageTransitionBuilder(),
              },
            ),
          ),
          home: auth.isAuth
              ? ProductOverviewScreen()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (context, authResultSnapshot) =>
                      authResultSnapshot.connectionState ==
                              ConnectionState.waiting
                          ? SplashScreen()
                          : AuthScreen(),
                ),
          routes: {
            // '/': (context) => ProductOverviewScreen(),
            ProductDetailsScreen.routeName: (context) => ProductDetailsScreen(),
            CartScreen.routeName: (context) => CartScreen(),
            OrderScreen.routeName: (context) => OrderScreen(),
            UserProductsScreen.routeName: (context) => UserProductsScreen(),
            EditProductScreen.routeName: (context) => EditProductScreen(),
          },
        ),
      ),
    );
  }
}

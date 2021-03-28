import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopon/src/helpers/custom_route.dart';
import 'package:shopon/src/providers/auth.dart';
import 'package:shopon/src/screens/order_screen.dart';
import 'package:shopon/src/screens/user_products_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, Function onTapHandler) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 24),
      ),
      onTap: onTapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Container(
          //   height: 160,
          //   width: double.infinity,
          //   padding: EdgeInsets.only(
          //     bottom: 20,
          //     left: 20,
          //     right: 20,
          //     top: 70,
          //   ),
          //   alignment: Alignment.centerLeft,
          //   color: Theme.of(context).primaryColor,
          //   child: Text(
          //     'ShopOn',
          //     style: TextStyle(
          //       fontSize: 30,
          //       color: Theme.of(context).primaryTextTheme.headline6.color,
          //     ),
          //   ),
          // ),
          AppBar(
            title: Text('ShopOn'),
            automaticallyImplyLeading: false,
          ),
          buildListTile('Home', () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Orders', () {
            Navigator.of(context).pushReplacementNamed(OrderScreen.routeName);
            // Navigator.of(context).pushReplacement(CustomRoute(
            //   builder: (context) => OrderScreen(),
            // ));
          }),
          buildListTile('User Products', () {
            Navigator.of(context)
                .pushReplacementNamed(UserProductsScreen.routeName);
          }),
          buildListTile('LogOut', () {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacementNamed('/');

            Provider.of<Auth>(context, listen: false).logOut();
          }),
        ],
      ),
    );
  }
}

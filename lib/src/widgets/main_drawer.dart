import 'package:flutter/material.dart';
import 'package:shopon/src/screens/order_screen.dart';

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
          buildListTile(
            'Orders',
            () {
              Navigator.of(context).pushReplacementNamed(OrderScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}

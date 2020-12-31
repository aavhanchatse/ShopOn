import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopon/src/providers/cart.dart' show Cart;
import 'package:shopon/src/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Consumer<Cart>(
                    builder: (context, value, child) => Chip(
                      label: Text(
                        '\$ ${value.totalAmount}',
                        style: TextStyle(
                            color: Theme.of(context)
                                .primaryTextTheme
                                .headline6
                                .color),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text(
                      'Place Order',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Consumer<Cart>(
            builder: (context, cart, child) => Expanded(
              child: ListView.builder(
                itemCount: cart.itemCount,
                itemBuilder: (context, i) => CartItem(
                  id: cart.items.values.toList()[i].id,
                  title: cart.items.values.toList()[i].title,
                  quantity: cart.items.values.toList()[i].quantity,
                  price: cart.items.values.toList()[i].price,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String title;
  final double price;
  final int quantity;

  CartItem({this.id, this.title, this.price, this.quantity});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: Padding(
        padding: EdgeInsets.all(6),
        child: ListTile(
          leading: CircleAvatar(
            radius: 35,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: FittedBox(child: Text('$price'),),
            ),
          ),
          title: Text(title),
          subtitle: Text('Total: \$ ${(quantity * price)}'),
          trailing: Text('$quantity x'),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopon/src/providers/orders.dart' show Orders;
import 'package:shopon/src/widgets/main_drawer.dart';
import 'package:shopon/src/widgets/order_item.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/orders-screen';
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      drawer: MainDrawer(),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (context, index) => OrderItem(orderData.orders[index]),
      ),
    );
  }
}

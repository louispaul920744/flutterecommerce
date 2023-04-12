import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/orders.dart' as Orders;
import 'package:shopapp/screens/appdrawer.dart';

import './orderItem.dart';
class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders.Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Orders",
          textAlign: TextAlign.center,
        ),
        
      ),
      drawer: ApppDrawer(),
      body: ListView.builder(itemBuilder:(ctx,i)=>
        OrderItem(order: orders.orders[i])
      ,itemCount: orders.orders.length,),
    );
  }
}

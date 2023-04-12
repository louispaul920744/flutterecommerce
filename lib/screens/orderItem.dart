import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shopapp/providers/orders.dart' as ord;
import 'package:intl/intl.dart';
import 'dart:math';

class OrderItem extends StatefulWidget {
  const OrderItem({super.key, required this.order});
  final ord.OrderItem order;

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text(
              '\$${widget.order.amount}',
            ),
            subtitle: Text(
              DateFormat('dd MM yyyy hh:mm').format(widget.order.dateTime),
            ),
            trailing: IconButton(
              icon: Icon(expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  expanded = !expanded;
                });
              },
            ),
          ),
          if (expanded)
            Container(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 10,vertical: 20),
                height: min(widget.order.products.length * 20 + 100, 180),
                child: ListView(
                  children: widget.order.products
                      .map((e) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            Text(
                              e.title,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text('${e.quantity}x\$${e.price}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.grey),)
                          ]))
                      .toList(),
                )),
        ],
      ),
    );
  }
}

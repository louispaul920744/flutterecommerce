import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/products.dart';
import '../providers/cart.dart';

class CartItems extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;

  CartItems(
    this.id,
    this.productId,
    this.price,
    this.quantity,
    this.title,
  );
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Colors.brown,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
      ),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: FittedBox(child: Text('\$$price'))),
            ),
            title: Text(title),
            subtitle: Text('Total" \$${(price * quantity)}'),
            trailing: Text('$quantity'),
          ),
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text("Are you sure?"),
            content: Text("Do you want to remove ite from cart"),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: Text("No")),
              ElevatedButton(
                  onPressed: () {
                    Provider.of<Cart>(ctx, listen: false)
                        .removeItem(productId);
                         Navigator.of(ctx).pop();
                  },
                  child: Text("Yes"))
            ],
          ),
        );
      },
      // onDismissed: (direction) {
      //
      // },
    );
  }
}

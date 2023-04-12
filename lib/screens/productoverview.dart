import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/cart.dart';
import 'package:shopapp/providers/products_provider.dart';
import 'package:shopapp/screens/ProductGrid.dart';
import 'package:shopapp/screens/appdrawer.dart';
import '../models/product.dart';
import 'ProductDetailPage.dart';

enum filteroptions { favorites, showall }

class Productoverview extends StatelessWidget {
  Productoverview({super.key});
  // ignore: non_constant_identifier_names

  @override
  Widget build(BuildContext context) {
    final productconatiner = Provider.of<Products>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Products List",
            textAlign: TextAlign.center,
          ),
          
          actions: [
            PopupMenuButton(
              onSelected: (filteroptions selectedValue) {
                if (selectedValue == filteroptions.favorites) {
                  productconatiner.showfavouritesonly();
                } else {
                  productconatiner.showall();
                }
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                PopupMenuItem(
                    child: Text("Only Favourites"),
                    value: filteroptions.favorites),
                PopupMenuItem(
                    child: Text("Show All"), value: filteroptions.showall)
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Consumer<Cart>(
                builder: (_, cart, ch) => Badge(
                  child: ch,
                  label: Text(cart.itemCount.toString()),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/cart');
                  },
                ),
              ),
            ),
          ],
        ),
         drawer: ApppDrawer(),
        body: ProductsGrid());
  }
}

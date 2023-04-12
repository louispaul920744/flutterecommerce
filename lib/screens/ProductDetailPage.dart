import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/models/product.dart';
import 'package:shopapp/providers/products.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:chips_choice/chips_choice.dart';

class Animal {
  final int id;
  final String name;

  Animal({
    required this.id,
    required this.name,
  });
}

class ProductDetailPage extends StatefulWidget {
  ProductDetailPage({
    super.key,
  });
  List<String> reportList = [
    "Not relevant",
    "Illegal",
    "Spam",
    "Offensive",
    "Uncivil"
  ];
  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  List<String> tags = [];
  _buildChoiceList() {
    List<Widget> choices = [];
    widget.reportList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(item),
          selectedColor: Colors.red,
          selected: tags.contains(item),
          onSelected: (selected) {
            setState(() {
              tags.contains(item) ? tags.remove(item) : tags.add(item);
            });
          },
        ),
      ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    final products = Provider.of<Products>(context).findById(args);
    List<String> _animals = ["Lion", "Flamingo", "Hippo"];

    List<Animal> _selectedAnimals = [];
    List<Animal> _selectedAnimals2 = [];
    List<Animal> _selectedAnimals3 = [];
    //List<Animal> _selectedAnimals4 = [];
    List<Animal> _selectedAnimals5 = [];

    List<String> options = [
      'News',
      'Entertainment',
      'Politics',
      'Automotive',
      'Sports',
      'Education',
      'Fashion',
      'Travel',
      'Food',
      'Tech',
      'Science',
    ];

    int? _value = 1;
    return Scaffold(
      appBar: AppBar(title: Text(products.title)),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                products.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '\$${products.price}',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                products.description,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}

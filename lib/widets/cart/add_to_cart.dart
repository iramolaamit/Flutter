import 'package:flutter/material.dart';
import 'package:untitled/models/cart.dart';
import 'package:untitled/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;

  AddToCart({Key? key, required this.catalog}) : super(key: key);

  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.item.contains(catalog);
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          isInCart = isInCart.toggle();
          final _catalog = CatalogModel();
          _cart.catalog = _catalog;
          _cart.add(catalog);
          // setState(() {});
        }
      },
      child: isInCart
          ? Icon(Icons.done_outline_sharp)
          : Icon(Icons.shopping_cart_outlined),
      style: ButtonStyle(
          shape: MaterialStateProperty.all(StadiumBorder()),
          backgroundColor:
              MaterialStateProperty.all(context.theme.buttonColor)),
    );
  }
}

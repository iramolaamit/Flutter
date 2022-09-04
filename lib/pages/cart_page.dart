import 'package:flutter/material.dart';
import 'package:untitled/core/store.dart';
import 'package:untitled/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        centerTitle: true,
        title: "Cart".text.xl4.color(context.accentColor).make(),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: _CartList(),
            ),
          ),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  _CartTotal({Key? key}) : super(key: key);

  // final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    final CartModel? _cart = (VxState.store as MyStore).cart;
    print('Build');
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          VxBuilder(
            mutations: {RemoveMutation},
            builder: (context, store, status) {
              return Text(
                '\$${_cart!.totalPrice}',
                textScaleFactor: 2,
                style: TextStyle(color: context.accentColor),
              );
            },
          ),
          SizedBox(
            width: 100,
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Buy is not supported yet")));
              },
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(context.theme.buttonColor)),
              child: Text(
                'Buy',
                textScaleFactor: 2,
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  // final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel? _cart = (VxState.store as MyStore).cart;

    return _cart!.item.isEmpty
        ? Center(
            child: Text(
            "Please add to cart",
            textScaleFactor: 2,
          ))
        : ListView.builder(
            // itemCount: 5,
            itemCount: _cart.item.length,
      itemBuilder: (context, index) => ListTile(
        trailing: IconButton(
                onPressed: () => RemoveMutation(_cart.item[index])
                // _cart.remove(_cart.item[index]);
                // setState(() {});
                ,
                icon: Icon(
                  Icons.remove_circle_sharp,
                  color: Colors.red,
                ),
              ),
        title: Text(_cart.item[index]!.name),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;
  const ItemWidget({Key? key, required this.item})
      : assert(item != null),
        // assert to use if it is not null
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey,
      child: ListTile(
        onTap: () {
          print('${item.name}');
        },
        leading: Image.network(
          item.image,
        ),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "\$${item.price}",
          textScaleFactor: 1.5,
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

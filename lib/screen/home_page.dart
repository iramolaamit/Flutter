import 'package:flutter/material.dart';
import 'package:untitled/models/catalog.dart';
import 'package:untitled/widets/drawer.dart';

import '../widets/item_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final dummyList = List.generate(20, (index) => CatalogModel().items[0]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Catalog App',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          // itemCount: CatalogModel().items.length,
          itemCount: dummyList.length,
          itemBuilder: (BuildContext context, int index) {
            return ItemWidget(
              // item: CatalogModel().items[index],
              item: dummyList[index],
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:untitled/models/catalog.dart';
import 'package:untitled/widets/drawer.dart';
import 'dart:convert';

import 'package:untitled/widets/item_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 5));
    final catalogJson =
        await rootBundle.loadString("assets/files/Catalog.json");
    print(catalogJson);
    final decodedData = jsonDecode(catalogJson);
    print(decodedData);
    var productsData = decodedData["products"];
    print(productsData);
    // to implement map in app
    CatalogModel.items = List.from(productsData).map<Item>((item) => Item.fromMap(item)).toList();

setState(() {});

  }

  // final dummyList = List.generate(4, (index) => CatalogModel.items![1]);
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
        child:
        (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
            ?
        ListView.builder(
                // itemCount: dummyList.length,
                itemCount: CatalogModel.items!.length,
                itemBuilder: (BuildContext context, int index) =>
                   ItemWidget(
                    // item: dummyList[index],
                    item: CatalogModel.items![index],
                   ),

              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/models/catalog.dart';
import 'package:untitled/widets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 15));
    final catalogJson =
    await rootBundle.loadString("assets/files/Catalog.json");
    final decodeData = jsonDecode(catalogJson);
    print(decodeData);
    var productsData = decodeData["products"];
    print(productsData);
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Catalog Home Page',
          textScaleFactor: 2,
          style: TextStyle(color: Colors.grey),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
            ? GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15),
          itemBuilder: (context, index) {
            final item = CatalogModel.items![index];
            return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                clipBehavior: Clip.antiAlias,
                child: GridTile(
                    header: Container(
                      child: Text(
                        item.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                      ),
                    ),
                    footer: Text(
                        textAlign: TextAlign.center,
                        '\$ ' + item.price.toString()),
                    child: Image.network(item.image)));
          },
          itemCount: CatalogModel.items!.length,
        )
            : Center(
            child: CircularProgressIndicator(
              strokeWidth: 22,
            )),
      ),
      drawer: MyDrawer(),
    );
  }
}

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/models/catalog.dart';
import 'package:untitled/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widets/homeWidgets/CatalogHeader.dart';
import '../widets/homeWidgets/CatalogList.dart';

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
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
        child: Icon(CupertinoIcons.cart, color: Colors.white),
        backgroundColor: context.theme.buttonColor,
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
                CatalogList().py16().expand()
              else
                CircularProgressIndicator(
                  color: context.accentColor,
                ).centered().py64().expand(),
            ],
          ),
        ),
      ),
    );
  }
}

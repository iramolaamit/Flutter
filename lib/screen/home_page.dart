import 'dart:convert';
import 'dart:math';
import 'package:untitled/widets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
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
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
                CatalogList().expand()
              else
                Center(child: CircularProgressIndicator()),
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          "Catalog Home".text.xl5.color(MyTheme.darkBlueColor).make(),
          "Treanding Products".text.xl2.make(),
          // Text(
          //   'Catalog Home',
          //   textScaleFactor: 2,
          //   style: TextStyle(
          //     color: Colors.black54,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          // Text(
          //   'Trending Products',
          //   textScaleFactor: 1.2,
          //   style: TextStyle(
          //     color: Colors.grey,
          //     fontWeight: FontWeight.w800,
          //   ),
          // ),
        ]);
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: CatalogModel.items!.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items![index];
        return CatalogItem(
          catalog: catalog,
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          CatalogImage(
            image: catalog.image,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.xl.color(MyTheme.darkBlueColor).bold.make(),
                catalog.desc.text.textStyle(context.captionStyle).make(),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,

                  children: [
                  '\$${catalog.price}'.text.bold.xl.make(),
                  ElevatedButton(
                    onPressed: () { },
                    child: "Buy".text.make(),
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(StadiumBorder()),
                      // backgroundColor: MaterialStateProperty.all(MyTheme.darkBlueColor)
                    ),
                  ),
                ],).pOnly(right: 8),
              ],
            ),
          )
        ],
      ),
    ).blue50.rounded.square(150).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .roundedLg
        .p8
        .color(MyTheme.creamColor)
        .make()
        .p8()
        .w24(
          context,
        );
  }
}

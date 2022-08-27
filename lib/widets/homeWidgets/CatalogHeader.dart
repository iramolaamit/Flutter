import 'package:flutter/material.dart';
import 'package:untitled/widets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

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

import 'package:flutter/material.dart';
import 'package:untitled/widets/homeWidgets/CatalogImage.dart';
import 'package:untitled/widets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catalog.dart';

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
                      onPressed: () {},
                      child: "Buy".text.make(),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(StadiumBorder()),
                        // backgroundColor: MaterialStateProperty.all(MyTheme.darkBlueColor)
                      ),
                    ),
                  ],
                ).pOnly(right: 8),
              ],
            ),
          )
        ],
      ),
    ).blue50.rounded.square(150).make().py16();
  }
}

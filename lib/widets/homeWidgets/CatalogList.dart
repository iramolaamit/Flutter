import 'package:flutter/material.dart';
import 'package:untitled/widets/cart/add_to_cart.dart';
import 'package:untitled/widets/homeWidgets/CatalogImage.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catalog.dart';
import '../../pages/home_detail_page.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: CatalogModel.items!.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items![index];
        // final catalog = CatalogModel.getByPosition(index);
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeDetailPage(catalog: catalog),
              ),
            );
          },
          child: CatalogItem(
            catalog: catalog,
          ),
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
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(
              image: catalog.image,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.xl.color(context.accentColor).bold.make(),
                catalog.desc.text.textStyle(context.captionStyle).make(),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    '\$${catalog.price}'.text.bold.xl.make(),
                    AddToCart(catalog: catalog),
                  ],
                ).pOnly(right: 4),
              ],
            ),
          )
        ],
      ),
    ).color(context.cardColor).rounded.square(150).make().py16();
  }
}

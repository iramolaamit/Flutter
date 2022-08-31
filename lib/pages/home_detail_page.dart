import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            '\$${catalog.price}'.text.bold.xl4.green600.make(),
            ElevatedButton(
              onPressed: () {},
              child: "Add to cart".text.make(),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(context.theme.buttonColor),
                shape: MaterialStateProperty.all(StadiumBorder()),
                // backgroundColor: MaterialStateProperty.all(MyTheme.darkBlueColor)
              ),
            ).wh(120, 50),
          ],
        ).pOnly(right: 32, left: 32),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                edge: VxEdge.TOP,
                child: Container(
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.xl4
                          .color(context.accentColor)
                          .bold
                          .make(),
                      catalog.desc.text
                          .textStyle(context.captionStyle)
                          .xl
                          .make(),
                      "Drawer widget is used to provide access to different destinations and functionalities provided in your application."
                          .text
                          .textStyle(context.captionStyle)
                          .make()
                          .p16(),
                    ],
                  ).py64(),
                ),
                arcType: VxArcType.CONVEY,
              ),
            ),
          ],
        ).py16(),
      ),
    );
  }
}

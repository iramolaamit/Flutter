import 'package:flutter/material.dart';
import 'package:untitled/widets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

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

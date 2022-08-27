import 'package:flutter/material.dart';

import '../../models/catalog.dart';
import 'CatalogItem.dart';

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

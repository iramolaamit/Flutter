import 'package:untitled/models/catalog.dart';

class CartModel {
  // Catalog field   orCollection of ids
  late CatalogModel _catalog;

  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog;

  set CatalogModel(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

//    Get items

  List get item => _itemIds.map((id) => _catalog.getById(id)).toList();

  // Get total price

  num get totalPrice =>
      item.fold(0, (previousValue, element) => previousValue + element.price);

  // add item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

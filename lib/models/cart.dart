import 'package:untitled/core/store.dart';
import 'package:untitled/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  //Singleton class
  // static final cartModel = CartModel._internal();
  //
  // CartModel._internal();
  //
  // factory CartModel() => cartModel;

  // Catalog field   orCollection of ids
  CatalogModel? _catalog;

  // Collection Ids to store Ids of each item
  final List<int> _itemIds = [];

  //get catalog
  CatalogModel get catalog => _catalog!;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

//    Get items

  List get item => _itemIds.map((id) => _catalog?.getById(id)).toList();

  // Get total price

  num get totalPrice =>
      item.fold(0, (previousValue, element) => previousValue + element!.price);

  // add item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);

  @override
  perform() {
    // TODO: implement perform
    store?.cart?._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);

  @override
  perform() {
    // TODO: implement perform
    store?.cart?._itemIds.remove(item.id);
  }
}
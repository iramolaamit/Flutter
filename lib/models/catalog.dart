class CatalogModel {
  static final catModel = CatalogModel._internal();

  CatalogModel._internal();

  factory CatalogModel() => catModel;
  static List<Item>? items;

// get item by id
  Item getById(int id) =>
      items!.firstWhere((element) => element.id == id, orElse: null);

  Item getByPosition(int pos) => items![pos];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});

  // used in decoding for frontend part
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      // value key
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      image: map["image"],
    );
  }
  //used for encoding String to map or backend or to map classt
  tomap() => {
        //key :value
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image,
      };

  // Item(this.id, this.name, this.desc, this.price, this.color, this.image);
}


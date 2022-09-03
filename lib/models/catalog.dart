class CatalogModel {
  static List<Item>? items;

  // static List<Item> items= [
  //   //   Item(
  //   //     id: 1,
  //   //     name: 'iPhone 12 Pro',
  //   //     desc: 'Apple iPhone 12th Gen',
  //   //     price: 9999,
  //   //     color: "#333505a",
  //   //     image:
  //   //         "https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg",
  //   //   ),
  //   //   Item(
  //   //     id: 3,
  //   //     name: "Pixel",
  //   //     desc: "Apple iPhone 12th Gen",
  //   //     price: 9999,
  //   //     color: "#333505a",
  //   //     image:
  //   //         "https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg",
  //   //   )
  //   // ];

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

// class CatalogModel {
//   final items = [
//     Item(1, 'iPhone 12 Pro', 'Apple iPhone 12th Gen', 9999, "#333505a",
//         "https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg")
//   ];
//
// }

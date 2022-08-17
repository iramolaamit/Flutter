class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(this.id, this.name, this.desc, this.price, this.color, this.image);
}

class CatalogModel {
  final items = [
    Item(1, 'iPhone 12 Pro', 'Apple iPhone 12th Gen', 9999, "#333505a",
        "https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg")
  ];
}

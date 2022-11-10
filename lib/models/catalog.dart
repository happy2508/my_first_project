class CatalogModels {
  static final items = [
    Item(
        id: 1,
        name: "iphone 12 pro",
        desc: "apple 12 genration ",
        price: 999,
        color: "#33505a",
        image:
            "https://img1.gadgetsnow.com/gd/images/products/additional/large/G201748_View_1/mobiles/smartphones/apple-iphone-12-pro-128-gb-gold-6-gb-ram-.jpg")
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String image;
  final String color;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.image,
      required this.color});
}

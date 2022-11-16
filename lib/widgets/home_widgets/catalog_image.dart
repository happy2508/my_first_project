import 'package:flutter/material.dart';
import 'package:my_first_project/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({super.key, required this.image});
  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .color(MyThemes.creamColor)
        .make()
        .py1()
        .w24(context);
  }
}

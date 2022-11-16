import 'package:flutter/material.dart';
import 'package:my_first_project/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      "Olx Pro".text.xl5.bold.color(MyThemes.darkBluishColor).make(),
      "Trending Products".text.xl2.make(),
    ]);
  }
}

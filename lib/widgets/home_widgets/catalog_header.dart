import 'package:flutter/material.dart';
import 'package:my_first_project/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      "Olx Pro".text.xl5.bold.color(context.theme.accentColor).make(),
      "Trending Products".text.color(context.theme.accentColor).xl2.make(),
    ]);
  }
}

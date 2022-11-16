import 'package:flutter/material.dart';
import 'package:my_first_project/models/catalog.dart';
import 'package:my_first_project/widgets/home_widgets/catalog_header.dart';
import 'package:my_first_project/widgets/home_widgets/catalog_list.dart';
import 'package:my_first_project/widgets/themes.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 20;

  final String name = "initcoders";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModels.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyThemes.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CatalogHeader(),
              if (CatalogModels.items != null && CatalogModels.items.isNotEmpty)
                CatalogList().py16()
              else
                CircularProgressIndicator().centered().expand(),
            ]),
          ),
        ),
      ),
    );
  }
}

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

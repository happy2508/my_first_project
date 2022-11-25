import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_project/core/store.dart';
import 'package:my_first_project/models/cart.dart';
import 'package:my_first_project/models/catalog.dart';
import 'package:my_first_project/utils/routes.dart';
import 'package:my_first_project/widgets/home_widgets/catalog_header.dart';
import 'package:my_first_project/widgets/home_widgets/catalog_list.dart';
import 'package:my_first_project/widgets/themes.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 20;

  final String name = "initcoders";

  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    //final catalogJson =
    //    await rootBundle.loadString("assets/files/catalog.json");
    final response = await http.get(Uri.parse(url));
    final catalogJson = response.body;

    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModels.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (context, _, __) => FloatingActionButton(
          onPressed: (() => Navigator.pushNamed(context, MyRoutes.cartRoute)),
          backgroundColor: context.theme.buttonColor,
          child: Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
        ).badge(color: Vx.red500, size: 20, count: _cart.items.length),
      ),
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
        .py24()
        .px2()
        .w24(context);
  }
}

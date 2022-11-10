import 'package:flutter/material.dart';
import 'package:my_first_project/models/catalog.dart';
import 'package:my_first_project/widgets/drawer.dart';

import '../widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  final int days = 20;
  final String name = "initcoders";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "OLX Pro",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
        itemCount: CatalogModels.items.length,
        itemBuilder: (context, index) {
          return ItemWidget(
            item: CatalogModels.items[index],
          );
        },
      ),
      drawer: MyDrawer(),
    );
  }
}

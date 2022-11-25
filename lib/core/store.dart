// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:velocity_x/velocity_x.dart';

import 'package:my_first_project/models/cart.dart';
import 'package:my_first_project/models/catalog.dart';

class MyStore extends VxStore {
  late CatalogModels catalog;
  late CartModel cart;

  MyStore() {
    catalog = CatalogModels();
    cart = CartModel();
    cart.catalog = catalog;
  }
}

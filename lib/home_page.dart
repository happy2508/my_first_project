import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final int days = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("first App"),
      ),
        body: Center(
          child: Container(
            child: Text("this is $days days of flutter at InitCoders "),
          ),
        ),
        drawer: Drawer(),
      );
  }
}

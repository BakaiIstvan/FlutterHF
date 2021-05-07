import 'dart:math';

import 'package:flutter/material.dart';

import '../widgets/list_item_widget.dart';
import '../data/photo_data_store.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  var startingIndex = 0;
  final listOffset = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NBA Teams"),
      ),
      body: ListView(
        children: [
          ...Iterable.generate(100000, (id) {
            var item = StockPhoto.fromId(id);
            return ListItemWidget(
              item: item,
            );
          })
        ],
      ),
    );
  }
}

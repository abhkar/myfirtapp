import 'package:counter/page/productListPage.dart';
import 'package:counter/store/myStore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  return runApp(ChangeNotifierProvider(
    create: (context) {
      return MyStore();
    },
    child: MaterialApp(
      home: ProductListPage(),
      debugShowCheckedModeBanner: false,
    ),
  ));
}

import 'package:counter/model/product.dart';
import 'package:flutter/cupertino.dart';

class MyStore extends ChangeNotifier {
  List<Product> _products = [];
  List<Product> _baskets = [];
  Product _activeProduct = null;

  MyStore() {
    _products = [
      Product(
          id: 1,
          qty: 0,
          name: "Fried Egg",
          price: 10,
          pic: "assets/images/ic_popular_food_1.png"),
      Product(
          id: 2,
          qty: 0,
          name: "Fried Egg2",
          price: 10,
          pic: "assets/images/ic_popular_food_1.png"),
      Product(
          id: 3,
          qty: 0,
          name: "Fried Egg3",
          price: 130,
          pic: "assets/images/ic_popular_food_3.png"),
      Product(
          id: 4,
          qty: 0,
          name: "Fried Egg4",
          price: 140,
          pic: "assets/images/ic_popular_food_4.png"),
      Product(
          id: 5,
          qty: 0,
          name: "Fried Egg5",
          price: 150,
          pic: "assets/images/ic_popular_food_5.png"),
      Product(
          id: 6,
          qty: 0,
          name: "Fried Egg 6",
          price: 160,
          pic: "assets/images/ic_popular_food_6.png")
    ];
    notifyListeners();
  }

  List<Product> get products => _products;
  List<Product> get baskets => _baskets;
  Product get activeProduct => _activeProduct;

  setActiveProduct(Product p) {
    _activeProduct = p;
  }

  addOneItemToBasket(Product p) {
    Product found =
        _baskets.firstWhere((a) => a.id == p.id, orElse: () => null);
    if (found != null) {
      found.qty += 1;
    } else {
      _baskets.add(p);
    }
    notifyListeners();
  }

  removeOneItemToBasket(Product p) {
    Product found =
        _baskets.firstWhere((a) => a.id == p.id, orElse: () => null);
    if (found != null && found.qty == 1) {
      _baskets.remove(p);
    } else {
      found.qty -= 1;
    }
    notifyListeners();
  }

  qtyBasketqty() {
    int total = 0;
    for (int i = 0; i < baskets.length; i++) {
      total += baskets[i].qty;
    }
    return total;
  }
}

import 'package:badges/badges.dart';
import 'package:counter/page/basketPage.dart';
import 'package:counter/store/myStore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var store = Provider.of<MyStore>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Badge(
          position: BadgePosition.topEnd(top: 0, end: 3),
          animationDuration: Duration(milliseconds: 300),
          animationType: BadgeAnimationType.slide,
          badgeContent: Text(
            store.qtyBasketqty().toString(),
            style: TextStyle(color: Colors.white),
          ),
          child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => BasketPage()),
                );
              }),
        ),
        heroTag: "btn5",
        onPressed: () {
          Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) => BasketPage()),
          );
        },
        backgroundColor: Color(0xFFfd2c2c),
        //child: Icon(Icons.shopping_cart),
      ),
      appBar: AppBar(title: Text("Product Detail")),
      body: Column(
        children: [
          Container(
            //width: 100,
            height: 100,
            child: Image.asset(store.activeProduct.pic),
          ),
          SizedBox(height: 10),
          Text(store.activeProduct.name),
          SizedBox(height: 10),
          Text(store.activeProduct.price.toString()),
          SizedBox(height: 10),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  store.removeOneItemToBasket(store.activeProduct);
                },
                icon: Icon(
                  Icons.remove,
                  color: Colors.red,
                ),
              ),
              Container(
                width: 50.0,
                height: 35.0,
                decoration: BoxDecoration(
                  color: Color(0xFFfd2c2c),
                  border: Border.all(color: Colors.white, width: 2.0),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Center(
                  child: Text(
                    store.activeProduct.qty.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  store.addOneItemToBasket(store.activeProduct);
                },
                icon: Icon(
                  Icons.add,
                  color: Colors.green,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

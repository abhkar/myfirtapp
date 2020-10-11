import 'package:badges/badges.dart';
import 'package:counter/store/myStore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BasketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var store = Provider.of<MyStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("cartPage"),
        actions: [
          Badge(
            position: BadgePosition.topEnd(top: 0, end: 3),
            animationDuration: Duration(milliseconds: 300),
            animationType: BadgeAnimationType.slide,
            badgeContent: Text(
              store.qtyBasketqty().toString(),
              style: TextStyle(color: Colors.white),
            ),
            child:
                IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: store.baskets.length,
        itemBuilder: (BuildContext context, int i) {
          return Container(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        //width: 100,
                        height: 100,
                        child: Image.asset(store.baskets[i].pic),
                      ),
                      Column(
                        children: [
                          Text(store.baskets[i].name),
                          Text(store.baskets[i].price.toString()),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  store.removeOneItemToBasket(store.baskets[i]);
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
                                  border: Border.all(
                                      color: Colors.white, width: 2.0),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Center(
                                  child: Text(
                                    store.baskets[i].qty.toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  store.addOneItemToBasket(store.baskets[i]);
                                },
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.green,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.delete_forever),
                      )
                    ]),
              ),
            ),
          );
        },
      ),
    );
    // ignore: dead_code
    // Widget _shoppingCartBadge() {
    //   return Badge(
    //     position: BadgePosition.topEnd(top: 0, end: 3),
    //     animationDuration: Duration(milliseconds: 300),
    //     animationType: BadgeAnimationType.slide,
    //     badgeContent: Text(
    //       store.qtyBasketqty().toString(),
    //       style: TextStyle(color: Colors.white),
    //     ),
    //     child: IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
    //   );
    // }
  }
}

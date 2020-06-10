import 'package:flutter/material.dart';
import 'package:flutterstatemanagement/model/cart_item.dart';
import 'package:flutterstatemanagement/model/items.dart';
import 'package:flutterstatemanagement/model/state_data.dart';
import 'package:flutterstatemanagement/screens/checkout_screen.dart';
import 'package:flutterstatemanagement/service/items_service.dart';
import 'package:provider/provider.dart';

class ItemsScreen extends StatelessWidget {
  static final String id = 'items_screen';

  final List<Item> items = ItemsService().getItems();

  List<Widget> getItemsList(BuildContext context) {
    List<Widget> tiles = [];
    for (int i = 0; i < items.length; i++) {
      Item item = items[i];
      tiles.add(Padding(
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(),
            color: (i % 2 == 0) ? Color(0xFFFBEFC6) : Colors.white,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Row(
            children: <Widget>[
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Text(
                  item.id,
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 5,
                child: Column(
                  children: <Widget>[
                    Text(item.itemName,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(height: 3.0),
                    Text(item.description)
                  ],
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: Column(
                  children: <Widget>[
                    Text('\$' + item.price.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(height: 3.0),
                    RaisedButton(
                      color: Colors.lightBlueAccent,
                      child: Text('Order'),
                      onPressed: () => {
                        Provider.of<StateData>(context, listen: false)
                            .addToCart(
                          CartItem(item.id, item, 1, item.price),
                        ),
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ));
    }
    return tiles;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Items Inventory'),
          actions: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, CheckoutScreen.id);
              },
              child: Icon(
                Icons.shopping_cart,
                size: 50.0,
                color: Color(0xFFFBEFC6),
              ),
            ),
            SizedBox(
              width: 20.0,
            )
          ],
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 25.0),
            child: Column(
              children: getItemsList(context),
            ),
          ),
        ),
      ),
    );
  }
}

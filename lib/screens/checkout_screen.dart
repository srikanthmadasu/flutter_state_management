import 'package:flutter/material.dart';
import 'package:flutterstatemanagement/model/cart_item.dart';
import 'package:flutterstatemanagement/model/state_data.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatelessWidget {
  static final String id = 'checkout_screen';

  @override
  Widget build(BuildContext context) {
    List<CartItem> items =
        Provider.of<StateData>(context, listen: true).getCartItems();

    List<Widget> list = [];
    for (int i = 0; i < items.length; i++) {
      CartItem item = items[i];
      list.add(Padding(
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
                  item.item.id,
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 3,
                child: Column(
                  children: <Widget>[
                    Text(
                      item.item.itemName,
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Text(
                  item.quantity.toString(),
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: Column(
                  children: <Widget>[
                    Text('\$' + (item.quantity * item.item.price).toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(height: 3.0),
                    RaisedButton(
                      color: Colors.redAccent,
                      child: Text('Remove'),
                      onPressed: () => {
                        Provider.of<StateData>(context, listen: false)
                            .removeFromCart(item)
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

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Checkout Screen'),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 25.0),
            child: Column(
              children: list,
            ),
          ),
        ),
      ),
    );
  }
}

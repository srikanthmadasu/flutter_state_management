import 'package:flutterstatemanagement/model/items.dart';

class CartItem {
  String id;
  Item item;
  int quantity;
  double totalPrice;

  CartItem(this.id, this.item, this.quantity, this.totalPrice);
}

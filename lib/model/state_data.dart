import 'package:flutter/material.dart';
import 'package:flutterstatemanagement/model/cart_item.dart';

class StateData extends ChangeNotifier {
  List<CartItem> _cartItems = [];

  addToCart(CartItem item) {
    _cartItems.add(item);
    notifyListeners();
  }

  removeFromCart(CartItem item) {
    _cartItems.remove(item);
    notifyListeners();
  }

  List<CartItem> getCartItems() {
    return _cartItems;
  }
}

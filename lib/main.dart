import 'package:flutter/material.dart';
import 'package:flutterstatemanagement/model/state_data.dart';
import 'package:flutterstatemanagement/screens/checkout_screen.dart';
import 'package:flutterstatemanagement/screens/items_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StateData(),
      child: MaterialApp(
          title: 'Flutter State Management',
          theme: ThemeData.light(),
          initialRoute: ItemsScreen.id,
          routes: {
            ItemsScreen.id: (context) => ItemsScreen(),
            CheckoutScreen.id: (context) => CheckoutScreen(),
          }),
    );
  }
}

import 'package:flutterstatemanagement/model/items.dart';

class ItemsService {
  List<Item> getItems() {
    List<Item> items = [];
    items.add(Item('MAC', 'MackBook', 'Super dooper macbook', 1000.0));
    items.add(Item('LEN', 'Lenovo', 'Super Lenovo thinkpad', 900.0));
    items.add(Item('DEL', 'Dell', 'Dell Laptop', 800.0));
    items.add(Item('NOT', 'Something', 'Not so super laptop', 100.0));
    return items;
  }
}

import 'package:flutter/foundation.dart';
import '../models/sushi.dart';

class CartProvider extends ChangeNotifier {
  final List<Sushi> _items = [];

  List<Sushi> get items => _items;
  int get totalCartItems => _items.length;

  void addItemToCart(Sushi sushi) {
    _items.add(sushi);
    notifyListeners();
  }

  void removeItemToCart(Sushi sushi) {
    _items.remove(sushi);
    notifyListeners();
  }

  void removeAllItemsToCart() {
    _items.clear();
    notifyListeners();
  }

  double get totalCartPrice {
    double totalPrice = 0;

    for (var item in _items) {
      totalPrice += item.price;
    }

    return totalPrice;
  }
}
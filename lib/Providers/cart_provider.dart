import 'package:flutter/material.dart';
import 'package:mini_mart/Models/products.dart';

class CartProvider extends ChangeNotifier {
  final Map<String, Product> _items = {};

  Map<String, Product> get items => _items;

  double get totalPrice => _items.values.fold(0, (sum, item) => sum + item.price);

  void addToCart(Product product) {
    _items[product.id] = product;
    notifyListeners();
  }

  void removeFromCart(String id) {
    _items.remove(id);
    notifyListeners();
  }
}
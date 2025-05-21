import 'package:flutter/cupertino.dart';
import 'package:mini_mart/Models/products.dart';

class ProductProvider extends ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: '9',
      title: 'Party Time Balloon',
      description: 'Perfect for celebrations',
      quantity: 'Pack of 12',
      price: 20.0,
      originalPrice: 47.0,
      imageUrl: 'assets/6.png',
    ),
    Product(
      id: '10',
      title: 'Decadent Chocolate Delight Cake',
      description: 'Perfect for celebrations',
      quantity: '500g',
      price: 200.0,
      originalPrice: 307.0,
      imageUrl: 'assets/1.png',
    ),
    Product(
      id: '11',
      title: 'Party Time Mic',
      description: 'Perfect for celebrations',
      quantity: 'Pack of 2',
      price: 49.0,
      originalPrice: 59.0,
      imageUrl: 'assets/3.png',
    ),
    Product(
      id: '12',
      title: 'Soda Lime with Orange Juice',
      description: 'Perfect for celebrations',
      quantity: '250 ml',
      price: 100.0,
      originalPrice: 150.0,
      imageUrl: 'assets/4.png',
    ),
    Product(
      id: '13',
      title: 'Banquet',
      description: 'Perfect for celebrations',
      quantity: '20 Different Flowers',
      price: 400.0,
      originalPrice: 470.0,
      imageUrl: 'assets/5.png',
    ),
    Product(
      id: '11',
      title: 'Party Time Music System',
      description: 'Perfect for celebrations',
      quantity: '4 Different Types of Speakers',
      price: 70000.0,
      originalPrice: 87000.0,
      imageUrl: 'assets/2.png',
    ),


  ];

  List<Product> get items => _items;
}

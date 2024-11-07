import 'package:flutter/material.dart';
import 'package:shopping_cart_app/models/product.dart';

class Shop extends ChangeNotifier {
  final List<Product> _shop = [
    Product(
        name: "Shoe",
        price: 364,
        imageUrl: "xyz",
        description: "This is the description of product"),
    Product(
        name: "Shirt",
        price: 364,
        imageUrl: "xyz",
        description: "This is the description of product"),
    Product(
        name: "Pant",
        price: 364,
        imageUrl: "xyz",
        description: "This is the description of product"),
    Product(
        name: "Tie",
        price: 364,
        imageUrl: "xyz",
        description: "This is the description of product"),
  ];

  List<Product> _cart = [];

  List<Product> get shop => _shop;
  List<Product> get cart => _cart;
  void addProductToCart(Product product) {
    _cart.add(product);
    notifyListeners();
  }

  void removeProductFromCart(Product product) {
    _cart.remove(product);
    notifyListeners();
  }
}

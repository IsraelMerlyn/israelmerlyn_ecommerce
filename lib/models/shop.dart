// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:israelmerlyn_ecommerce/models/product.dart';

class Shop extends ChangeNotifier {
  //product for sale
  final List<Product> _shop = [
    Product(
      name: 'producto 1',
      price: 99,
      description:
          ',samsung galaxy,samsung galaxy,samsung galaxy,samsung galaxy',
      imagePath: 'assets/iphone.jpg',
    ),
    Product(
      name: 'producto 2',
      price: 99,
      description: 'item description',
      imagePath: 'assets/iphone.jpg',
    ),
    Product(
      name: 'producto 3',
      price: 99,
      imagePath: 'assets/iphone.jpg',
      description: 'item description',
    ),
  ];
  //user cart

  final List<Product> _cart = [];
  //get product list

  List<Product> get shop => _shop;
  // get ser cart
  List<Product> get cart => _cart;
  //add item to cart
  void addTocart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  //remove item from cart
  void removeItemCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}

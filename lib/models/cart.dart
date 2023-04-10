import 'package:flutter/widgets.dart';

import 'shoe.dart';

class Cart extends ChangeNotifier {
  // List of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
      name: 'Air Jordan',
      price: '236',
      imagePath: 'images/1.jpg',
      description: 'The forward-thinking design of his latest signature shoe.',
    ),
    Shoe(
      name: 'Zoom Freak',
      price: '220',
      imagePath: 'images/2.jpg',
      description: 'The forward-thinking design of his latest signature shoe.',
    ),
    Shoe(
      name: 'KD Treys',
      price: '240',
      imagePath: 'images/3.jpg',
      description: 'The forward-thinking design of his latest signature shoe.',
    ),
    Shoe(
      name: 'Kyrie 6',
      price: '190',
      imagePath: 'images/4.jpg',
      description: 'The forward-thinking design of his latest signature shoe.',
    ),
  ];

  // List of items in user cart
  List<Shoe> userCart = [];

  // Get list of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  // Get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  // Add items to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // Remove item from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}

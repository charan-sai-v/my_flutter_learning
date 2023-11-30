import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/shoe.dart';

class Cart extends ChangeNotifier {
  // list of shoe for sale
  List<Shoe> shoeShop = [
    Shoe(
        name: 'Shoe 1',
        price: '1200',
        imagePath: 'lib/images/shoe1.png',
        description: 'Shoe 1 is the amazing shoe product'),
    Shoe(
        name: 'Shoe 2',
        price: '3000',
        imagePath: 'lib/images/shoe2.png',
        description: 'Shoe 2 is the amazing shoe product'),
    Shoe(
        name: 'Shop 3',
        price: '2500',
        imagePath: 'lib/images/shoe3.png',
        description: 'Shoe 3 is the amazing shoe product'),
    Shoe(
        name: 'Shop 4',
        price: '1500',
        imagePath: 'lib/images/shoe4.png',
        description: 'Shoe 4 is the amazing shoe product'),
  ];

  // list of shoe in use cart
  List<Shoe> userCart = [];

  // get list of shoes for sale
  List<Shoe> getShopList() {
    return shoeShop;
  }

  // get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  // add items to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localstorage/localstorage.dart';
import 'package:shopink/Data/CartData.dart';
import 'package:shopink/Model/ProductDetails.dart';

class LandingController extends GetxController {
  final localStorage = LocalStorage('shopink');

  List<ProductDetails> getCart() {
    return [...cartDetails];
  }

  void addItem(ProductDetails productDetails, int qty) {
    // debugPrint(cartDetails.length.toString());
    final isExit = cartDetails
        .where((product) => product.id == productDetails.id)
        .toList()
        .isNotEmpty;
    final index =
        cartDetails.indexWhere((product) => product.id == productDetails.id);

    if (isExit) {
      cartDetails[index].selectedQuantity += qty;
    } else {
      cartDetails.add(productDetails);
    }

    // add a json
    List temp = [];
    for (var item in cartDetails) {
      temp.add(item.toJson());
    }
    localStorage.setItem('cartData', json.encode(temp));
  }

  Future<void> getCartData() async {
    cartDetails = [];
    await localStorage.ready;
    final body = localStorage.getItem('cartData');
    // debugPrint(body.toString());
    if (body != null) {
      final data = json.decode(body);
      // debugPrint(data.toString());

      if (data != null) {
        for (var item in data) {
          if (item is ProductDetails) {
            cartDetails.add(item);
          } else {
            cartDetails.add(ProductDetails.fromJson(item));
          }
        }
      } else {
        cartDetails = [];
      }
    } else {
      cartDetails = [];
    }
    // debugPrint(cartDetails.length.toString());
  }

  void removeItem(ProductDetails productDetails) {
    if (productDetails.selectedQuantity <= 1) {
      for (int i = 0; i < cartDetails.length; ++i) {
        if (productDetails.id == cartDetails[i].id) {
          cartDetails.removeAt(i);
        }
      }
      print(productDetails.id);
    } else {
      for (int i = 0; i < cartDetails.length; i++) {
        if (productDetails.id == cartDetails[i].id) {
          --cartDetails[i].selectedQuantity;
        }
      }
    }
    List temp = [];
    for (var item in cartDetails) {
      temp.add(item.toJson());
    }
    localStorage.setItem('cartData', json.encode(temp));
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localstorage/localstorage.dart';
import 'package:shopink/Data/ProductDetailsData.dart';
import 'package:shopink/Data/favoriteData.dart';
import 'package:shopink/Model/ProductDetails.dart';

class Favorite_controller extends GetxController {
  final localStorage = LocalStorage('shopink');
  void addFav(int index) {
    if (productDetails[index].favorite) {
      favList.add(productDetails[index]);
    } else {
      for (int i = 0; i < productDetails.length; i++) {
        if (productDetails[index].id == favList[i].id) {
          productDetails[i].favorite = false;
          favList.removeAt(i);
          break;
        }
      }
    }

    // add a json
    List temp = [];
    for (var item in favList) {
      temp.add(item.toJson());
    }
    localStorage.setItem('favList', json.encode(temp));
  }

  Future<void> getCartData() async {
    favList = [];
    await localStorage.ready;
    final body = localStorage.getItem('favList');
    debugPrint(body.toString());
    if (body != null) {
      final data = json.decode(body);
      debugPrint(data.toString());

      if (data != null) {
        for (var item in data) {
          if (item is ProductDetails) {
            favList.add(item);
          } else {
            favList.add(ProductDetails.fromJson(item));
          }
        }
      } else {
        favList = [];
      }
    } else {
      favList = [];
    }
    debugPrint(favList.length.toString());
  }

  void removeFav(index) {
    for (int i = 0; i < productDetails.length; i++) {
      if (productDetails[i].id == favList[index].id) {
        productDetails[i].favorite = false;
        break;
      }
    }
    favList.removeAt(index);
    List temp = [];
    for (var item in favList) {
      temp.add(item.toJson());
    }
    localStorage.setItem('favList', json.encode(temp));
  }
}

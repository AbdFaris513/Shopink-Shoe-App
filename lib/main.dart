import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopink/BottomNav.dart';
import 'package:shopink/Contant/Route.dart';
import 'package:shopink/cart.dart';
import 'package:shopink/Service/Common/LandingPageHeader.dart';
import 'package:shopink/LandingPage.dart';
import 'package:shopink/Service/LoginPage/login.dart';
import 'package:shopink/Service/LoginPage/signup.dart';
import 'package:shopink/ProductDetailsView.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoute.bottomNav,
      getPages: [
        GetPage(
          name: '/login',
          page: (() => Login()),
        ),
        GetPage(
          name: '/signup',
          page: (() => const Signup()),
        ),
        GetPage(
          name: '/landingPage',
          page: (() => const LandingPage()),
        ),
        GetPage(
          name: '/landingHeader',
          page: (() => const LandingHeader()),
        ),
        GetPage(
          name: '/productDetailsView',
          page: (() => const ProductDetailsView()),
        ),
        GetPage(
          name: '/cart',
          page: (() => const cart()),
        ),
        GetPage(
          name: '/bottomNav',
          page: (() => const BottomNavPage()),
        ),
      ],
    );
  }
}

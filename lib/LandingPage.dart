import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopink/Data/Brands.dart';
import 'package:shopink/Service/Common/newArrival.dart';
import 'package:shopink/Service/controller/favorite_controller.dart';

import 'Data/ProductDetailsData.dart';
import 'Service/Common/LandingPageHeader.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  Favorite_controller favController = Get.put(Favorite_controller());
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text(
          'Shopink',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.all(10),
            child: CircleAvatar(
              radius: 13,
              backgroundColor: Color.fromARGB(255, 211, 205, 205),
              child: Icon(
                Icons.notifications_outlined,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const LandingHeader(),
              // Get.toNamed('/landingHeader'),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.all(4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'New Arrival',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 21,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(
                          color: Color.fromARGB(255, 85, 85, 85),
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              SizedBox(
                height: 210,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: productDetails.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return NewArrival(
                        name: productDetails[index].name,
                        gender: productDetails[index].gender,
                        price: productDetails[index].price,
                        img: productDetails[index].img[0],
                        isFavarite: productDetails[index].favorite,
                      );
                    }),
              ),

              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.all(4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Best Seller',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 21,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(
                          color: Color.fromARGB(255, 85, 85, 85),
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 25,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: brand.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: selectedIndex == index
                                      ? Colors.yellow.shade700
                                      : const Color.fromARGB(
                                          255, 235, 235, 235),
                                  borderRadius: BorderRadius.circular(70)),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              margin: const EdgeInsets.only(right: 8),
                              child: Center(
                                child: Text(
                                  brand[index],
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 16,
              ),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: productDetails.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.68),
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.toNamed('/productDetailsView', arguments: {
                              'name': productDetails[index].name,
                              'gender': productDetails[index].gender,
                              'price': productDetails[index].price,
                              'imgLists': productDetails[index].img,
                              'size': productDetails[index].size,
                              'discripstion':
                                  productDetails[index].discripstion,
                              'selectedQuantity':
                                  productDetails[index].selectedQuantity,
                              'rating': productDetails[index].rating,
                              'favorite': productDetails[index].favorite,
                              'id': productDetails[index].id
                            });
                          },
                          child: Container(
                            width: 200,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(26, 168, 168, 168),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image(
                                    image: NetworkImage(
                                      productDetails[index].img[0],
                                    ),
                                    width: double.infinity,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            productDetails[index].name,
                            style: const TextStyle(fontWeight: FontWeight.w800),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    productDetails[index].gender,
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 108, 108, 108),
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.2,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    '\$ ${productDetails[index].price}',
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 0.2,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  productDetails[index].favorite =
                                      !productDetails[index].favorite;

                                  favController
                                      .addFav(index); // goto Controller
                                });
                              },
                              child: CircleAvatar(
                                radius: 14,
                                backgroundColor:
                                    const Color.fromARGB(255, 238, 238, 238),
                                child: Icon(
                                  productDetails[index].favorite
                                      ? Icons.favorite
                                      : Icons.favorite_outline,
                                  size: 22,
                                  color: productDetails[index].favorite
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

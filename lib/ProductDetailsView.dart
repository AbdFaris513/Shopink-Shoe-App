import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shopink/Model/ProductDetails.dart';
import 'package:shopink/Service/controller/landingController.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({
    super.key,
  });

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  LandingController controller = Get.put(LandingController());
  int q = 0;
  final String name = Get.arguments['name'];

  final String gender = Get.arguments['gender'];

  final double price = Get.arguments['price'];

  final List<dynamic> imgLists = Get.arguments['imgLists'];

  final List<int> size = Get.arguments['size'];

  final String discripstion = Get.arguments['discripstion'];

  int selectedQuantity = Get.arguments['selectedQuantity'];

  bool favorite = Get.arguments['favorite'];

  final double rating = Get.arguments['rating'];

  final int id = Get.arguments['id'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 243, 243),
      appBar: AppBar(
        title: const Text(
          'Details Products',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.close(1);
          },
          icon: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(60),
            ),
            child: const Align(
              alignment: Alignment(.45, 0.25),
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 15,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white10,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.all(15),
            child: CircleAvatar(
              radius: 13,
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              child: Icon(
                Icons.more_horiz,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  height: 230,
                  width: double.infinity,
                  color: Colors.grey,
                  child: Image(
                    image: NetworkImage(imgLists[0]),
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    height: 75,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: imgLists.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: SizedBox(
                            height: 60,
                            width: 60,
                            child: CircleAvatar(
                              backgroundColor:
                                  const Color.fromARGB(234, 255, 255, 255),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image(
                                  image: NetworkImage(imgLists[index]),
                                  fit: BoxFit.cover,
                                  height: 55,
                                  width: 55,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 22,
                ),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    name,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    gender,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Color.fromARGB(255, 122, 122, 122),
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    favorite = !favorite;
                                  });
                                },
                                child: CircleAvatar(
                                  radius: 16,
                                  backgroundColor:
                                      const Color.fromARGB(255, 243, 243, 243),
                                  child: Icon(
                                    favorite
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: favorite ? Colors.red : Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                '\$$price',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '\$${price + 10}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.red,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          SizedBox(
                            height: 50,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: size.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: const Color.fromARGB(
                                        255, 243, 243, 243),
                                    radius: 22,
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.white),
                                      child: Center(
                                        child: Text(
                                          size[index].toString(),
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(discripstion),
                          const SizedBox(
                            height: 5,
                          ),
                          const Divider(
                            color: Color.fromARGB(255, 158, 158, 158),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                rating.toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Icon(
                                Icons.star,
                                color: Color.fromARGB(
                                  255,
                                  255,
                                  230,
                                  0,
                                ),
                                size: 20,
                              ),
                              const Icon(
                                Icons.star,
                                color: Color.fromARGB(
                                  255,
                                  255,
                                  230,
                                  0,
                                ),
                                size: 20,
                              ),
                              const Icon(
                                Icons.star,
                                color: Color.fromARGB(
                                  255,
                                  255,
                                  230,
                                  0,
                                ),
                                size: 20,
                              ),
                              const Icon(
                                Icons.star,
                                color: Color.fromARGB(
                                  255,
                                  255,
                                  230,
                                  0,
                                ),
                                size: 20,
                              ),
                              const Icon(
                                Icons.star_half,
                                color: Color.fromARGB(
                                  255,
                                  255,
                                  230,
                                  0,
                                ),
                                size: 20,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 135,
                                height: 45,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 243, 243, 243),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedQuantity =
                                              selectedQuantity <= 1
                                                  ? selectedQuantity
                                                  : --selectedQuantity;
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: CircleAvatar(
                                          backgroundColor: const Color.fromARGB(
                                              255, 0, 32, 57),
                                          radius: 22,
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                color: Colors.white),
                                            child: const Center(
                                              child: Icon(
                                                Icons.remove,
                                                color: Color.fromARGB(
                                                    255, 0, 32, 57),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        selectedQuantity.toString(),
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          ++selectedQuantity;
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: CircleAvatar(
                                          backgroundColor: const Color.fromARGB(
                                              255, 0, 32, 57),
                                          radius: 22,
                                          child: Container(
                                            width: 26,
                                            height: 26,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                color: const Color.fromARGB(
                                                    255, 0, 32, 57)),
                                            child: const Center(
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  ProductDetails productToAdd = ProductDetails(
                                    id: id,
                                    name: name,
                                    gender: gender,
                                    price: price,
                                    rating: rating,
                                    buyingCount: 7000,
                                    size: [],
                                    favorite: false,
                                    selectedQuantity: selectedQuantity,
                                    img: <String>[
                                      imgLists[0].toString(),
                                    ],
                                    discripstion: discripstion,
                                  );
                                  controller.addItem(
                                      productToAdd, selectedQuantity);
                                  // cartDetails.add(productToAdd);
                                  Get.toNamed('/cart');
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  backgroundColor:
                                      const Color.fromARGB(255, 244, 219, 0),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 70,
                                    vertical: 14,
                                  ),
                                ),
                                child: const Text(
                                  'Add to cart',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

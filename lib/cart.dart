import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopink/Data/CartData.dart';
import 'package:shopink/Service/controller/landingController.dart';

class cart extends StatefulWidget {
  const cart({super.key});

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  LandingController controller = Get.put(LandingController());
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () async {
      setState(() {
        isLoading = true;
      });
      await controller.getCartData();
      debugPrint(cartDetails.length.toString());
      setState(() {
        isLoading = false;
      });
    });
  }

  double subtotal() {
    double sum = 0;
    for (int i = 0; i < cartDetails.length; i++) {
      sum += cartDetails[i].price * cartDetails[i].selectedQuantity;
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'My Cart',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 239, 239, 239),
              borderRadius: BorderRadius.circular(60),
            ),
            child: const Align(
              alignment: Alignment(.35, 0.18),
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
              radius: 15,
              backgroundColor: Color.fromARGB(255, 239, 239, 239),
              child: Icon(
                Icons.more_horiz,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  thickness: 1.3,
                  color: Color.fromARGB(255, 237, 237, 237),
                ),
                SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: SizedBox(
                    height: 420,
                    child: ListView.builder(
                        itemCount: cartDetails.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image(
                                          image: NetworkImage(
                                              cartDetails[index].img[0]),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            cartDetails[index].name,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                            maxLines: 2,
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            cartDetails[index].gender,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromARGB(
                                                  255, 107, 107, 107),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                          SizedBox(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "\$${cartDetails[index].price}",
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                Container(
                                                  width: 90,
                                                  height: 35,
                                                  decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                                        255, 216, 216, 216),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            controller
                                                                .removeItem(
                                                                    cartDetails[
                                                                        index]);
                                                          });
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 4),
                                                          child: CircleAvatar(
                                                            backgroundColor:
                                                                const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    0,
                                                                    32,
                                                                    57),
                                                            radius: 15,
                                                            child: Container(
                                                              width: 25,
                                                              height: 25,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            50),
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              child: const Icon(
                                                                Icons.remove,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        0,
                                                                        32,
                                                                        57),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        cartDetails[index]
                                                            .selectedQuantity
                                                            .toString(),
                                                        style: const TextStyle(
                                                            fontSize: 20),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          controller.addItem(
                                                              cartDetails[
                                                                  index],
                                                              1);
                                                          setState(() {});
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  right: 4),
                                                          child: CircleAvatar(
                                                            backgroundColor:
                                                                const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    0,
                                                                    32,
                                                                    57),
                                                            radius: 15,
                                                            child: Container(
                                                              width: 25,
                                                              height: 25,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            50),
                                                                color: const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    0,
                                                                    32,
                                                                    57),
                                                              ),
                                                              child: const Icon(
                                                                Icons.add,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                thickness: 1.3,
                                color: Color.fromARGB(255, 237, 237, 237),
                              ),
                            ],
                          );
                        }),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Subtotal : ',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            '\$${subtotal().toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Delivery Fee : ',
                              style: TextStyle(fontSize: 16)),
                          Text(
                            '\$10.00',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Discount : ', style: TextStyle(fontSize: 16)),
                          Text(
                            '10%',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Divider(
                        thickness: 1.3,
                        color: Color.fromARGB(255, 237, 237, 237),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Total : ',
                              style: TextStyle(fontSize: 16)),
                          Text(
                            '\$${(10 + (subtotal()) - ((10 / 100) * (subtotal() + 10))).toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {
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
                            horizontal: 80,
                            vertical: 14,
                          ),
                        ),
                        child: const Text(
                          'Check out',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}

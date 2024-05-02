import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopink/Data/favoriteData.dart';
import 'package:shopink/Service/controller/favorite_controller.dart';

class FavoritrPage extends StatefulWidget {
  const FavoritrPage({super.key});

  @override
  State<FavoritrPage> createState() => _FavoritrPageState();
}

class _FavoritrPageState extends State<FavoritrPage> {
  Favorite_controller favController = Get.put(Favorite_controller());
  bool isLoading = false;

  // Load a Local Storage
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      setState(() {
        isLoading = true;
      });
      await favController.getCartData();
      debugPrint(favList.length.toString());
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Favorite',
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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Divider(
              thickness: 1,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: favList.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image(
                              height: 100,
                              width: 100,
                              image: NetworkImage(favList[index].img[0]),
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  favList[index].name,
                                  style: const TextStyle(fontSize: 14),
                                ),
                                Text(favList[index].gender)
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  favController.removeFav(index);
                                });
                              },
                              child: CircleAvatar(
                                backgroundColor:
                                    const Color.fromARGB(255, 234, 234, 234),
                                child: Icon(
                                  favList[index].favorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: favList[index].favorite
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          thickness: 1,
                        )
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

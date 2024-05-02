import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NewArrival extends StatefulWidget {
  NewArrival(
      {super.key,
      required this.name,
      required this.gender,
      required this.price,
      required this.img,
      required this.isFavarite});
  final String name;
  final String gender;
  final double price;
  final String img;
  bool isFavarite;

  @override
  State<NewArrival> createState() => _NewArrivalState();
}

class _NewArrivalState extends State<NewArrival> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: SizedBox(
        width: 140,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 110,
              width: 140,
              decoration: BoxDecoration(
                color: const Color.fromARGB(26, 168, 168, 168),
                borderRadius: BorderRadius.circular(16),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image(
                  image: NetworkImage(widget.img),
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                widget.name,
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
                        widget.gender,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 108, 108, 108),
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        '\$ ${widget.price}',
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
                      widget.isFavarite = !widget.isFavarite;
                    });
                  },
                  child: CircleAvatar(
                    radius: 14,
                    backgroundColor: const Color.fromARGB(255, 238, 238, 238),
                    child: Icon(
                      widget.isFavarite
                          ? Icons.favorite
                          : Icons.favorite_outline,
                      size: 22,
                      color: widget.isFavarite ? Colors.red : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

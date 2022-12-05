import 'package:flutter/material.dart';

class Items extends StatefulWidget {
  final Map<String, dynamic> itemsData;

  Items({super.key, required this.itemsData});
  
  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                widget.itemsData["image"],
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(238, 27, 69, 185),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      widget.itemsData["title"],
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


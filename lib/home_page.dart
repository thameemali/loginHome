import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> images = [
    "assets/captain.jpg",
    "assets/blackpanther.jpg",
    "assets/hawk eye.jpg",
    "assets/ironman.jpg",
    "assets/loki.jpg",
    "assets/marvel.jpg",
    "assets/spiderman.jpg",
    "assets/thor.jpg",
    "assets/wonderwoman.png",
    "assets/thanos.jpg",
  ];

  List<String> image_name = [
    "Captain America",
    "Black Panther",
    "Hawk Eye",
    "Iron Man",
    "Loki",
    "Captain Marvel",
    "Spider Man",
    "Thor",
    "Wonder Woman",
    "Thanos",
  ];

  bool _isList = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: Container(
                child: const Text(
                  'Login Home',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                    _isList = !_isList;
                });
              },
              icon: Icon(_isList ? Icons.grid_view : Icons.list),
            ),
          ],
        ),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: _isList ?

        ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return Text(
              image_name[index],
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.deepOrangeAccent,
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              height: 40,
              thickness: 1,
            );
          },
          itemCount: image_name.length,
        )
        : GridView.builder(
      itemCount: images.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Image.asset(images[index]);
      },
    )
      ),
    );
  }
}

import 'package:flutter/material.dart';

AppBar notepadAppbar(VoidCallback onLoadNotes) {
  return AppBar(
    leading: IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.table_rows,
        color: const Color.fromARGB(255, 255, 17, 0),
      ),
    ),
    backgroundColor: Colors.black,
    toolbarHeight: 45,
    actions: [
      IconButton(
        onPressed: () {
          onLoadNotes();
          print('object');
        },
        icon: Icon(
          Icons.more_horiz_outlined,
          color: const Color.fromARGB(255, 255, 17, 0),
        ),
      ),
    ],
  );
}

Container appbarLine(double width) {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.transparent,
          Color.fromARGB(255, 255, 255, 255),
          Color.fromARGB(255, 255, 255, 255),
          Color.fromARGB(255, 255, 17, 0),
          Color.fromARGB(255, 255, 17, 0),
          Colors.transparent,
        ],
        stops: [0.0, 0.07, 0.13, 0.40, 0.96, 1.0],
      ),
      borderRadius: BorderRadius.circular(2000),
    ),
    width: width,
    height: 2,
  );
}

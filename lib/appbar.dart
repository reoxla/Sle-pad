import 'package:flutter/material.dart';

Color red = Color.fromARGB(255, 255, 17, 0);

AppBar notepadAppbar(VoidCallback onLoadNotes) {
  return AppBar(
    leading: IconButton(
      onPressed: () {},
      icon: Icon(Icons.table_rows, color: red),
    ),
    backgroundColor: Colors.black,
    toolbarHeight: 45,
    actions: [
      IconButton(
        onPressed: () {
          onLoadNotes();
          print('object');
        },
        icon: Icon(Icons.more_horiz_outlined, color: red),
      ),
    ],
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(2),
      child: SizedBox(height: 2, width: 560, child: appbarLine(560)),
    ),
  );
}

Container appbarLine(double width) {
  Color white = Colors.white;
  Color transparent = Colors.transparent;

  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [transparent, white, white, red, red, transparent],
        stops: [0.0, 0.07, 0.13, 0.40, 0.96, 1.0],
      ),
      borderRadius: BorderRadius.circular(2000),
    ),
    width: width,
    height: 2,
  );
}

import 'package:flutter/material.dart';

Color red = Color.fromARGB(255, 255, 17, 0);

AppBar notepadAppbar(VoidCallback onLoadNotes, BuildContext context) {
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
      child: SizedBox(height: 2, width: 560, child: appbarLine(context)),
    ),
  );
}

Container appbarLine(BuildContext context) {
  Color white = Colors.white;
  Color transparent = Colors.transparent;
  double width = MediaQuery.of(context).size.width;

  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [transparent, white, white, red, red, transparent],
        stops: [0.0, 0.07, 0.13, 0.40, 0.96, 1.0],
      ),
      borderRadius: BorderRadius.circular(2000),
    ),
    width: width * 0.98,
    height: 2,
  );
}

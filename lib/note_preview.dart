import 'appbar.dart';
import 'database_helper.dart';

import 'package:flutter/material.dart';

Color grey = Colors.grey.shade800;

Container _notePreviewTop(String? context) {
  return Container(
    width: 550,
    height: 100,
    margin: EdgeInsets.only(top: 13),
    padding: EdgeInsets.only(left: 15, top: 40, right: 15),
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      ),
    ),
    child: Text(
      context ?? '',
      overflow: TextOverflow.ellipsis,
      style: TextStyle(color: grey, fontSize: 30, fontWeight: FontWeight.bold),
      textAlign: TextAlign.left,
    ),
  );
}

Stack _notePreviewBottom(String title, String date, int id, Function setstate) {
  Radius radius = Radius.circular(25);

  return Stack(
    children: [
      Container(
        alignment: Alignment.centerLeft,
        width: 550,
        height: 60,
        margin: EdgeInsets.only(bottom: 3),
        padding: EdgeInsets.only(left: 20, top: 5),
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.only(
            bottomLeft: radius,
            bottomRight: radius,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 550),
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: grey,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              date.substring(0, 10),
              style: TextStyle(color: grey, fontSize: 13),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 320),
        child: previewOptions(id, setstate),
      ),
    ],
  );
}

Row notePreview({
  required int id,
  required String title,
  String? context,
  required String lastUpdatedDate,
  required Function setstate,
}) {
  return Row(
    children: [
      Spacer(flex: 1),
      Expanded(
        flex: 30,
        child: Column(
          children: [
            _notePreviewTop(context),
            appbarLine(560),
            _notePreviewBottom(title, lastUpdatedDate, id, setstate),
          ],
        ),
      ),
      Spacer(flex: 1),
    ],
  );
}

PopupMenuButton previewOptions(int id, Function setstate) {
  return PopupMenuButton<String>(
    color: Colors.black,
    padding: EdgeInsets.all(2),
    menuPadding: EdgeInsetsGeometry.all(1),
    icon: Icon(Icons.more_vert_outlined, color: grey),
    onSelected: (value) {
      switch (value) {
        case "edit":
          print("edit");
          break;
        case "delete":
          print("delte");
          Note.deleteNote(id);
          setstate();
          break;
      }
    },
    itemBuilder: (BuildContext context) => [
      PopupMenuItem(
        height: 40,
        value: "edit",
        child: SizedBox(width: 25, child: Text("Edit")),
      ),
      PopupMenuItem(
        height: 40,
        value: "delete",
        child: SizedBox(child: Text("Delete")),
      ),
    ],
  );
}

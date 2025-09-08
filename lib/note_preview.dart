import 'appbar.dart';
import 'database_helper.dart';

import 'package:flutter/material.dart';

Color grey = Colors.grey.shade800;

Container _notePreviewTop(String? content, BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;

  return Container(
    width: width * 0.95,
    height: height * 0.133,
    margin: EdgeInsets.only(top: width * 0.05),
    padding: EdgeInsets.only(
      left: width * 0.035,
      top: width * 0.09,
      right: width * 0.035,
    ),
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      ),
    ),
    child: Text(
      content ?? '',
      overflow: TextOverflow.ellipsis,
      style: TextStyle(color: grey, fontSize: 30, fontWeight: FontWeight.bold),
      textAlign: TextAlign.left,
    ),
  );
}

Stack _notePreviewBottom(
  String title,
  String date,
  int id,
  Function setstate,
  BuildContext context,
) {
  Radius radius = Radius.circular(25);
  double width = MediaQuery.of(context).size.width;

  return Stack(
    children: [
      Container(
        alignment: Alignment.centerLeft,
        width: width * 0.95,
        height: width * 0.175,
        margin: EdgeInsets.only(bottom: width * 0.003),
        padding: EdgeInsets.only(left: width * 0.045, top: width * 0.013),
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
            SizedBox(width: width * 0.95),
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
        margin: EdgeInsets.only(left: width * 0.82),
        child: previewOptions(id, setstate),
      ),
    ],
  );
}

Row notePreview({
  required int id,
  required String title,
  String? content,
  required String lastUpdatedDate,
  required Function setstate,
  required BuildContext context,
}) {
  return Row(
    children: [
      Spacer(flex: 1),
      Expanded(
        flex: 30,
        child: Column(
          children: [
            _notePreviewTop(content, context),
            appbarLine(context),
            _notePreviewBottom(title, lastUpdatedDate, id, setstate, context),
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

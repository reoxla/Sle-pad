import 'appbar.dart';

import 'package:flutter/material.dart';

Container _notePreviewTop(String context) {
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
      context.substring(0, 40),
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: Colors.grey.shade800,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.left,
    ),
  );
}

Container _notePreviewBottom(String title, String date) {
  return Container(
    alignment: Alignment.centerLeft,
    width: 550,
    height: 60,
    margin: EdgeInsets.only(bottom: 3),
    padding: EdgeInsets.only(left: 20, top: 5),
    decoration: BoxDecoration(
      color: Colors.grey.shade900,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(25),
        bottomRight: Radius.circular(25),
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
            color: Colors.grey.shade800,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          date,
          style: TextStyle(color: Colors.grey.shade800, fontSize: 13),
        ),
      ],
    ),
  );
}

Row notePreview(String title, String context, String lastUpdatedDate) {
  return Row(
    children: [
      Spacer(flex: 1),
      Expanded(
        flex: 30,
        child: Column(
          children: [_notePreviewTop(context), appbarLine(560), _notePreviewBottom(title, lastUpdatedDate)],
          
        ),
      ),
      Spacer(flex: 1),
    ],
  );
}

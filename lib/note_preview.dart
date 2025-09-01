import 'appbar.dart';

import 'package:flutter/material.dart';

Container _notePreviewTop() {
  return Container(
    width: 550,
    height: 120,
    margin: EdgeInsets.only(top: 30),
    padding: EdgeInsets.only(left: 20, top: 30),
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      ),
    ),
    child: Text(
      "sdfmsdfm sdfsdlfjsldf sd...",
      style: TextStyle(
        color: Colors.grey.shade800,
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.left,
    ),
  );
}

Container _notePreviewBottom() {
  return Container(
    alignment: Alignment.centerLeft,
    width: 550,
    height: 60,
    margin: EdgeInsets.only(bottom: 10),
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
          "Title Long Title",
          style: TextStyle(
            color: Colors.grey.shade800,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "12.12.2008",
          style: TextStyle(color: Colors.grey.shade800, fontSize: 13),
        ),
      ],
    ),
  );
}

Column notePreview() {
  return Column(
    children: [_notePreviewTop(), appbarLine(560), _notePreviewBottom()],
  );
}

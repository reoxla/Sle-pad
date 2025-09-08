import 'package:flutter/material.dart';
import 'package:notepad/appbar.dart';

import 'database_helper.dart';

UnderlineInputBorder _inputBorder(Color argb) {
  return UnderlineInputBorder(borderSide: BorderSide(color: argb));
}

WidgetStateProperty<Color> _stateProperty(Color hovered, Color any) {
  return WidgetStateProperty<Color>.fromMap(<WidgetStatesConstraint, Color>{
    WidgetState.pressed | WidgetState.hovered: hovered,
    WidgetState.any: any,
  });
}

String? title;

void _addNoteDialog(BuildContext context, Function state) {
  double height = MediaQuery.of(context).size.height * 0.15;
  double widht = MediaQuery.of(context).size.width * 0.9;

  TextStyle textStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  Color bgColor = Color.fromARGB(255, 17, 17, 17);
  Color red = Color.fromARGB(255, 255, 17, 0);
  Color darkRed = Color.fromARGB(255, 156, 16, 0);

  showDialog(
    context: context,
    builder: (ctx) {
      return AlertDialog(
        constraints: BoxConstraints(minHeight: height, minWidth: widht),
        backgroundColor: bgColor,
        title: Text("Create New Note", style: textStyle),
        actions: [
          TextField(
            decoration: InputDecoration(
              hintText: "Title",
              fillColor: Colors.white,
              enabledBorder: _inputBorder(darkRed),
              focusedBorder: _inputBorder(red),
            ),
            onChanged: (value) {
              title = value;
            },
          ),
          TextButton(
            onPressed: () async {
              if (title == null) {
                print("object");
                return;
              } else {
                await Note.addNote(context: '', title: title!);
                state();
                Navigator.of(context).pop();
                title = null;
              }
            },
            style: ButtonStyle(
              overlayColor: _stateProperty(
                darkRed.withAlpha(150),
                red.withAlpha(150),
              ),
              foregroundColor: _stateProperty(darkRed, red),
            ),
            child: Text("Create"),
          ),
        ],
      );
    },
  );
}

FloatingActionButton addNoteButton(BuildContext context, Function state) {
  return FloatingActionButton(
    onPressed: () {
      _addNoteDialog(context, state);
      state();
    },
    backgroundColor: red,
    splashColor: Colors.transparent,
    enableFeedback: false,
    elevation: 2,
    child: Icon(Icons.add, color: Colors.white, size: 35),
  );
}

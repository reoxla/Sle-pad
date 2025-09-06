import 'package:flutter/material.dart';

import 'database_helper.dart';

class AddNoteButton extends StatefulWidget {
  const AddNoteButton({super.key});

  @override
  State<AddNoteButton> createState() => _AddNoteButtonState();
}

class _AddNoteButtonState extends State<AddNoteButton> {
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

  void _addNoteDialog() {
    var height = MediaQuery.of(context).size.height * 0.15;
    var widht = MediaQuery.of(context).size.width * 0.9;
    var bgColor = Color.fromARGB(255, 17, 17, 17);
    var textStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.bold);

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
                enabledBorder: _inputBorder(Color.fromARGB(255, 156, 16, 0)),
                focusedBorder: _inputBorder(Color.fromARGB(255, 255, 17, 0)),
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
                  await Note.addNote(
                    context: 'delhdfskfbsdfbsdfbsdlf',
                    title: title!,
                  );
                }
              },
              style: ButtonStyle(
                overlayColor: _stateProperty(
                  Color.fromARGB(150, 156, 16, 0),
                  Color.fromARGB(150, 255, 17, 0),
                ),
                foregroundColor: _stateProperty(
                  Color.fromARGB(255, 156, 16, 0),
                  Color.fromARGB(255, 255, 17, 0),
                ),
              ),
              child: Text("Create"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          _addNoteDialog();
        });
      },
      backgroundColor: const Color.fromARGB(255, 255, 17, 0),
      splashColor: Colors.transparent,
      enableFeedback: false,
      elevation: 2,
      child: Icon(Icons.add, color: Colors.white, size: 35),
    );
  }
}

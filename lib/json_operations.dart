import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class AddNoteButton extends StatefulWidget {
  const AddNoteButton({super.key});

  @override
  State<AddNoteButton> createState() => _AddNoteButtonState();
}

class _AddNoteButtonState extends State<AddNoteButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        setState(() {});
      },
      backgroundColor: const Color.fromARGB(255, 228, 15, 0),
      splashColor: Colors.transparent,
      enableFeedback: false,
      elevation: 2,
      child: Icon(Icons.add, color: Colors.white, size: 35),
    );
  }
}

Future<List<dynamic>> loadNotes() async {
  final String response = await rootBundle.loadString("assets/Notes.json");
  final data = await jsonDecode(response) as Map<String, dynamic>;
  final items = data["items"] as List<dynamic>;

  return items.map((item) => item as Map<String, dynamic>).toList();
}

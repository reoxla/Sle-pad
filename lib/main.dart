import 'json_operations.dart';
import 'appbar.dart';
import 'note_preview.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const AnasaSayfa(),
    );
  }
}

class AnasaSayfa extends StatefulWidget {
  const AnasaSayfa({super.key});

  @override
  State<AnasaSayfa> createState() => _AnasaSayfaState();
}

class _AnasaSayfaState extends State<AnasaSayfa> {
  List notes = [];

  Future<void> loadAndSetNotes() async {
    final loadedNotes = await loadNotes(); // this returns the list
    setState(() {
      notes = loadedNotes;
      print(notes);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 17, 17, 17),
      appBar: notepadAppbar(loadAndSetNotes),

      body: Column(children: [
        ...List.generate(notes.length, (i) {
          return notePreview(notes[i]['title'], notes[i]['context'], notes[i]['last updated date']);
        })
      ],),
      floatingActionButton: AddNoteButton(),
    );
  }
}

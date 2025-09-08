import 'appbar.dart';
import 'note_preview.dart';
import 'add_note_button.dart';
import 'database_helper.dart';

import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
  List<Map<String, dynamic>> notes = [];

  Future<void> loadAndSetNotes() async {
    var fetched = await Note.getNotes();
    setState(() {
      notes = fetched; // ✅ ensure correct type
      print(notes);
    });
  }

  @override
  void initState() {
    Note.initDatabase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (notes.isEmpty) {
      setState(() {
        loadAndSetNotes();
      });
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 17, 17, 17),
      appBar: notepadAppbar(loadAndSetNotes, context),

      body: SingleChildScrollView(
        child: Column(
          children: [
            ...List.generate(notes.length, (i) {
              return notePreview(
                id: notes[i]['id'],
                title: notes[i]['title'],
                content: notes[i]['context'],
                lastUpdatedDate: notes[i]['lastUpdatedDate'],
                setstate: loadAndSetNotes,
                context: context,
              );
            }),
            Text(notes.length.toString()),
          ],
        ),
      ),
      floatingActionButton: addNoteButton(context, loadAndSetNotes),
    );
  }
}

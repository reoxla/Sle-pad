import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class Note {
  static Database? database;
  static late String dbPath;

  static Future<void> initDatabase() async {
    try {
      dbPath = join(await getDatabasesPath(), "mydb.db");
      database = await openDatabase(
        dbPath,
        version: 1,
        singleInstance: true,
        onCreate: (db, i) {
          db.execute('''CREATE TABLE notes(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        context TEXT,
        creationDate DATE,
        lastUpdatedDate DATE
        )''');
        },
      );
    } catch (e) {
      print("HATA $e");
    }
  }

  static Future<List<Map<String, dynamic>>> getNotes() async {
    if (database == null) {
      return [];
    }

    var notesRead = await database!.query("notes");

    return notesRead;
  }

  static Future<void> addNote({String? context, required String title}) async {
    if (database == null) {
      return;
    }

    try {
      Map<String, dynamic> value = {
        'title': title,
        'context': context,
        'creationDate': DateTime.now().toIso8601String(),
        'lastUpdatedDate': DateTime.now().toIso8601String(),
      };
      await database!.insert("notes", value);
    } catch (e) {
      print("Error $e");
    }
  }

  static void deleteNote(int id) async {
    if (database == null) {
      return;
    }
    await database!.delete("notes", where: 'id = $id');
  }
}

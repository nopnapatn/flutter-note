import 'package:flutter/material.dart';
import 'package:note/data/hive_database.dart';
import 'package:note/models/note.dart';

class NoteData extends ChangeNotifier {
  final db = HiveDatabase();

  List<Note> allNote = [];

  void initializeNotes() {
    allNote = db.loadNotes();
  }

  List<Note> getAllNotes() {
    return allNote;
  }

  void addNewNote(Note note) {
    allNote.add(note);
    notifyListeners();
  }

  void updateNote(Note note, String text) {
    for (int i = 0; i < allNote.length; i++) {
      if (allNote[i].id == note.id) {
        allNote[i].text = text;
      }
    }
    notifyListeners();
  }

  void deleteNote(Note note) {
    allNote.remove(note);
    notifyListeners();
  }
}

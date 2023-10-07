import 'package:hive/hive.dart';
import 'package:note/models/note.dart';

class HiveDatabase {
  final _myBox = Hive.box('note_database');
  List<Note> loadNotes() {
    List<Note> saveNotesFormatted = [];
    if (_myBox.get('ALL_NOTES') != null) {
      List<dynamic> saveNotes = _myBox.get('ALL_NOTES');
      for (int i = 0; i < saveNotes.length; i++) {
        Note individualNote = Note(id: saveNotes[i][0], text: saveNotes[i][1]);
        saveNotesFormatted.add(individualNote);
      }
    } else {
      saveNotesFormatted.add(Note(id: 0, text: 'Getting Started!'));
    }
    return saveNotesFormatted;
  }

  void saveNotes(List<Note> allNotes) {
    List<List<dynamic>> allNotesFormatted = [];
    for (var note in allNotes) {
      int id = note.id;
      String text = note.text;
      allNotesFormatted.add([id, text]);
    }

    _myBox.put("ALL_NOTES", allNotesFormatted);
  }
}

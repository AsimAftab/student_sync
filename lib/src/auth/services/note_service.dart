import '../model/note.dart';

class NoteRepository {
  Future<List<Note>> fetchNotes() async {
    // Simulating network call
    await Future.delayed(const Duration(seconds: 2)); // Simulating network delay
    return [
      Note(title: 'Note 1', content: 'This is the content of note 1'),
      Note(title: 'Note 2', content: 'This is the content of note 2'),
    ]; // Return some dummy notes
  }
}

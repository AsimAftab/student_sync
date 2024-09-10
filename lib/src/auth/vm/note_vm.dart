import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/note.dart';
import '../services/note_service.dart';

// Repository provider with autoDispose
final noteRepositoryProvider = Provider.autoDispose((ref) => NoteRepository());

// FutureProvider for fetching notes
final noteListProvider = FutureProvider.autoDispose<List<Note>>((ref) async {
  final repository = ref.watch(noteRepositoryProvider);
  return repository.fetchNotes();
});

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/note.dart';
import '../services/note_service.dart';

// Repository provider with autoDispose
final noteRepositoryProvider = Provider.autoDispose((ref) => NoteRepository());

// ViewModel provider with autoDispose
final noteViewModelProvider = StateNotifierProvider.autoDispose<NoteViewModel, List<Note>>((ref) {
  final repository = ref.watch(noteRepositoryProvider);
  return NoteViewModel(repository);
});

// ViewModel (StateNotifier) to manage notes state
class NoteViewModel extends StateNotifier<List<Note>> {
  final NoteRepository _repository;

  NoteViewModel(this._repository) : super([]);

  Future<void> loadNotes() async {
    state = await _repository.fetchNotes();
  }

}

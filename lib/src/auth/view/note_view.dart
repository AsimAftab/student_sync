import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../vm/note_vm.dart';

class NoteListScreen extends ConsumerWidget {
  const NoteListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(noteViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: vm.isEmpty
          ? const Center(child: CircularProgressIndicator()) // Show spinner while loading
          : ListView.builder(
        itemCount: vm.length,
        itemBuilder: (context, index) {
          final note = vm[index];
          return ListTile(
            title: Text(note.title),
            subtitle: Text(note.content),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Reload the notes when the button is pressed
          ref.read(noteViewModelProvider.notifier).loadNotes();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

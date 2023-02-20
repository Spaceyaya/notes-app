import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';

import 'package:notes_app/view/widgets/edit_notes_body.dart';

class EditNotes extends StatelessWidget {
  const EditNotes({Key? key, required this.notes}) : super(key: key);
  final NoteModel notes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditNotesBody(
        notes: notes,
      ),
    );
  }
}

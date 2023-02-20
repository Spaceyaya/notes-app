import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/consts.dart';
import 'package:notes_app/models/note_model.dart';
part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel>? notes;
  fetchAllNotes() async {
    var noteBox = Hive.box<NoteModel>(notesBox);

    notes = noteBox.values.toList();
    emit(NotesSuccess());
  }
}

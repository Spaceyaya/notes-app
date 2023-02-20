import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/consts.dart';
import 'package:notes_app/models/note_model.dart';
part 'add_notes_state.dart';

class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(AddNotesInitial());
  Color color = const Color(0xff735290);
  addNote(NoteModel noteModel) async {
    noteModel.color = color.value;
    emit(AddNotesLoading());
    try {
      var noteBox = Hive.box<NoteModel>(notesBox);
      await noteBox.add(noteModel);
      emit(AddNotesSuccess());
    } catch (e) {
      emit(
        AddNotesFailure(
          e.toString(),
        ),
      );
    }
  }
}

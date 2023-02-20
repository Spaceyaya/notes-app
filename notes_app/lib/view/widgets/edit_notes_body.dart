import 'package:flutter/material.dart';

import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/view/notes_view.dart';


import 'package:notes_app/view/widgets/custom_appbar.dart';
import 'package:notes_app/view/widgets/custom_textfield.dart';
import 'package:notes_app/view/widgets/edit_list.dart';

class EditNotesBody extends StatefulWidget {
  const EditNotesBody({Key? key, required this.notes}) : super(key: key);
  final NoteModel notes;

  @override
  State<EditNotesBody> createState() => _EditNotesBodyState();
}

class _EditNotesBodyState extends State<EditNotesBody> {
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          CustomAppBar(
            onPressed: () {
              widget.notes.title = title ?? widget.notes.title;
              widget.notes.subTitle = subTitle ?? widget.notes.subTitle;
              widget.notes.save();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const NotesView();
                }),
              );
            },
            title: 'Edit Note',
            icon: Icons.check,
          ),
          const SizedBox(
            height: 50,
          ),
          CustomTextfield(
              onChanged: (value) {
                title = value;
              },
              hint: widget.notes.title),
          const SizedBox(
            height: 16,
          ),
          CustomTextfield(
            onChanged: (value) {
              subTitle = value;
            },
            hint: widget.notes.subTitle,
            maxLines: 5,
          ),
          const SizedBox(
            height: 16,
          ),
          EditViewColorsList(
            noteModel: widget.notes,
          ),
        ],
      ),
    );
  }
}

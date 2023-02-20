import 'package:flutter/material.dart';
import 'package:notes_app/consts.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield(
      {Key? key,
      required this.hint,
      this.maxLines = 1,
      this.onSaved,
      this.onChanged})
      : super(key: key);
  final String hint;
  final int maxLines;
  final void Function(String?)? onSaved;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        } else {
          return null;
        }
      },
      onChanged: onChanged,
      onSaved: onSaved,
      maxLines: maxLines,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        hintText: hint,
        border: outlineInutBorder(),
        enabledBorder: outlineInutBorder(),
        focusedBorder: outlineInutBorder(
          kPrimaryColor,
        ),
      ),
    );
  }

  OutlineInputBorder outlineInutBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: color ?? Colors.white));
  }
}

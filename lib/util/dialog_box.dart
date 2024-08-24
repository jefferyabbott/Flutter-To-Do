import 'package:flutter/material.dart';
import 'dialog_button.dart';

class DialogBox extends StatelessWidget {
  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  final TextEditingController controller;

  VoidCallback onSave;
  VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.white,
        content: SizedBox(
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // get user input
              TextField(
                controller: controller,
                focusNode: FocusNode(),
                autofocus: true,
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "add a new task",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // cancel button
                    DialogButton(
                      text: "cancel",
                      onPressed: onCancel,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    // save button
                    DialogButton(
                      text: "save",
                      onPressed: onSave,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

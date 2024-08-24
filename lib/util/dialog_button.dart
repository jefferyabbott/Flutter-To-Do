import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {
  DialogButton(
      {super.key, required String text, required void Function() onPressed})
      : _onPressed = onPressed,
        _text = text;

  final String _text;
  final VoidCallback _onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: Colors.black),
      ),
      onPressed: _onPressed,
      color: Theme.of(context).primaryColor,
      child: Text(
        _text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

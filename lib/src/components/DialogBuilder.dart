import 'package:flutter/material.dart';

Future<bool?> dialogBuilder(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Color(
          0xFF263123,
        ),
        title: const Text(
          'Finish game',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        content: const Text(
          'Are you sure you want to finish this game?',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text(
              'No',
              style: TextStyle(
                color: Color(
                  0xFF85D47E,
                ),
                fontSize: 16,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text(
              'Yes',
              style: TextStyle(
                color: Color(
                  0xFF85D47E,
                ),
                fontSize: 16,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
        ],
      );
    },
  );
}

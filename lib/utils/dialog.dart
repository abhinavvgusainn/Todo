import 'package:flutter/material.dart';

class MyDialog extends StatelessWidget {
  final controller;
  void Function()? onSave;
  MyDialog({
    super.key,
    required this.controller,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 120,
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add a new task',
              ),
              controller: controller,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  color: Colors.white70,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel'),
                ),
                SizedBox(
                  width: 10,
                ),
                MaterialButton(
                  color: Colors.white70,
                  onPressed: onSave,
                  child: Text('Save'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

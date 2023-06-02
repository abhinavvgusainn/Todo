import 'package:flutter/material.dart';
import 'package:todo/utils/dialog.dart';
import 'package:todo/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  final List todoList = [
    ['Code', false],
    ['learn', false]
  ];

  void checkboxChanged(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  void saveTask() {
    setState(() {
      todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void addNewTask() {
    showDialog(
      context: context,
      builder: (context) => MyDialog(
        controller: _controller,
        onSave: saveTask,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0,
        title: Text('TO DO'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: todoList[index][0],
            taskCompleted: todoList[index][1],
            onChanged: (value) => checkboxChanged(value, index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewTask,
        child: Icon(Icons.add),
      ),
    );
  }
}

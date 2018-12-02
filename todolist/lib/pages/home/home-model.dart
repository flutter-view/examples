import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:tester/app-model.dart';
import 'package:tester/pages/home/home.dart';

class HomePageModel extends Model {
  HomePageModel({@required this.app}) : taskNameController = TextEditingController(text: '');

  final AppModel app;
  final TextEditingController taskNameController;

  onCheckPressed(Task task, bool value) {
    this.app.updateTask(task, value);
  }

  onTaskDismissed(Task task) {
    this.app.removeTask(task);
  }

  onAddButtonPressed(BuildContext context) {
    this.taskNameController.text = '';
    showDialog(
      context: context,
      builder: (context) => AddTaskDialog(
            controller: this.taskNameController,
            onOk: () {
              this.app.addTask(title: taskNameController.text);
              Navigator.of(context).pop();
            },
            onCancel: () {
              Navigator.of(context).pop();
            },
          ),
    );
  }

  taskTextDecoration(task) {
    return task.done ? TextDecoration.lineThrough : TextDecoration.none;
  }
}

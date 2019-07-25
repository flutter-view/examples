import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutter_view_widgets/flutter_view_widgets.dart';
import 'package:todolist/model/app-model.dart';
import 'package:todolist/model/task.dart';
import 'package:todolist/pages/taskspage/taskspage.dart';

/// This is the backing model for the page. It stores data and controllers that 
/// are related to presenting page information, and it handles events from the page.
/// It has a reference to the app, so it can ask the app model to perform app-level operations.
class TasksPageModel extends Model {
  TasksPageModel({@required this.app}) : taskNameController = TextEditingController(text: '');

  final AppModel app;
  final TextEditingController taskNameController;

  /// Called when the user checks a task
  onCheckPressed(Task task, bool value) {
    this.app.updateTask(task, value);
  }

  /// Called when the user performs a swipe to dismiss a task
  onTaskDismissed(Task task) {
    this.app.removeTask(task);
  }

  /// Called when the user presses the add task button.
  /// Shows a dialog with a text field to giving a title
  onAddButtonPressed(BuildContext context) {
    this.taskNameController.text = '';
    showDialog(
      context: context,
      // here we call another flutter-view function, one that shows the dialog
      // note how we pass properties into it, including event handlers
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

  /// Example of a computed property:
  /// Returns the text decoration for the text of a given task
  taskTextDecoration(Task task) {
    return task.done ? TextDecoration.lineThrough : TextDecoration.none;
  }
}

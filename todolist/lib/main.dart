import 'package:flutter/material.dart';
import 'package:todolist/app-model.dart';
import 'package:todolist/pages/taskspage/taskspage-model.dart';
import 'package:todolist/pages/taskspage/taskspage.dart';

void main() {
  runApp(TodoListApp());
}

class TodoListApp extends StatefulWidget {
  @override
  createState() => _TodoListAppState();
}

class _TodoListAppState extends State<TodoListApp> {
  /// The app contains a list of tasks and app-level functions
  AppModel app;

  @override
  void initState() {
    super.initState();
    app = AppModel();
    app.start(); // allows the app to load tasks on startup
  }

  @override
  build(context) => MaterialApp(
        title: 'Todo List',
        // we pass a new task page model into the page, with a reference to our app
        home: TasksPage(model: TasksPageModel(app: app)),
      );
}

import 'dart:convert' as convert;

import 'package:flutter_view_widgets/flutter_view_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/model/task.dart';

class AppModel extends Model {
  AppModel(): tasks = [];

  List<Task> tasks;

  start() {
    loadTasks();
  }

  addTask({required String title}) {
    final task = Task(name: title);
    this.tasks.add(task);
    this.notifyListeners();
    saveTasks();
  }

  updateTask(Task task, bool isChecked) {
    task.done = isChecked;
    task.notifyListeners();
    saveTasks();
  }

  removeTask(Task task) {
    this.tasks.remove(task);
    this.notifyListeners();
    saveTasks();
  }

  saveTasks() async {
    final data = tasks.map((task) => task.toMap()).toList();
    final json = convert.json.encode(data);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('tasks', json);
  }

  loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString('tasks');
    if (json != null) {
      final data = convert.json.decode(json) as List;
      this.tasks = data.map((entry) => Task.fromMap(entry)).toList();
      this.notifyListeners();
    }
  }
}


import 'dart:convert' as convert;

import 'package:meta/meta.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tester/pages/home/home-model.dart';

class AppModel extends Model {
  AppModel() {
    this.tasks = [];
    this.homePage = HomePageModel(app: this);
  }

  List<Task> tasks;
  HomePageModel homePage;

  start() {
    loadTasks();
  }

  addTask({String title}) {
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

class Task extends Model {
  Task({@required this.name, this.done = false});

  String name;
  bool done;

  factory Task.fromMap(map) => Task(name: map['name'], done: map['done']);
  Map toMap() => {'name': name, 'done': done};
}

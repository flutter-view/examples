import 'package:meta/meta.dart';
import 'package:flutter_view_widgets/flutter_view_widgets.dart';

class Task extends Model {
  Task({required this.name, this.done = false});

  String name;
  bool done;

  // these methods let us serialize and deserialize a task, so we can store and load it
  factory Task.fromMap(map) => Task(name: map['name'], done: map['done']);
  Map toMap() => {'name': name, 'done': done};
}

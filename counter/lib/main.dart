import 'package:flutter/material.dart';
import 'package:counter/app-model.dart';
import 'package:counter/pages/home/homepage.dart';

void main() {
  runApp(CounterApp());
}

class CounterApp extends StatefulWidget {
  @override
  createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {

  /// Contains the state and functions of our application,
  /// which we can pass down into fluttter-view functions
  AppModel app;

  @override
  void initState() {
    super.initState();
    app = AppModel();
  }

  @override
  build(context) => MaterialApp(
        title: 'Counter App',
        home: HomePage(model: app), // render the homepage, passing the model
      );
}

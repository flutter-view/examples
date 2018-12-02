import 'package:flutter/material.dart';
import 'package:tester/app-model.dart';
import 'package:tester/pages/home/home-model.dart';
import 'package:tester/pages/home/home.dart';

void main() {
  runApp(TestApp());
}

class TestApp extends StatefulWidget {
  @override
  createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  AppModel app;

  @override
  void initState() {
    super.initState();
    app = AppModel();
    app.start();
  }

  @override
  build(context) => MaterialApp(
        title: 'Todo List',
        home: HomePage(model: HomePageModel(app: app)),
      );
}

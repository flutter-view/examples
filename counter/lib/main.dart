import 'package:flutter/material.dart';
import 'package:tester/app-model.dart';
import 'package:tester/pages/animations/animations.dart';
import 'package:tester/pages/home/home.dart';
import 'package:tester/pages/test/test.dart';
import 'package:tester/test-model.dart';

void main() {
  runApp(TestApp());
}

class TestApp extends StatelessWidget {
  final model = AppModel();
  final testModel = TestModel();

  @override
  build(context) => HomePage(model: model);
  // build(context) => TestPage(model: testModel);
  // build(context) => AnimationsPage(model: model);
}

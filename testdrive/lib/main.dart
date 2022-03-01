import 'package:flutter/material.dart';
import 'pages/homepage/homepage.dart';


void main() => runApp(const TestdriveApp());


class TestdriveApp extends StatelessWidget {
  const TestdriveApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Testdrive App',
      home: HomePage()
    );
  }

}

import 'package:flutter/material.dart';
import 'screens/homepage/homepage.dart';


void main() => runApp(TestdriveApp());


class TestdriveApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Testdrive App',
      home: HomePage()
    );
  }

}

import 'package:flutter/material.dart';
import 'package:submission_1_disebud/pages/loginPage_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DisebudStay',
      theme: ThemeData.light(),
      home: LoginPage(),
    );
  }
}

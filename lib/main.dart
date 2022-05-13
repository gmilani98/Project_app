//import 'dart:html';
import 'package:prova/screen/HomePage.dart';
import 'package:prova/screen/LoginPage.dart';
import 'package:flutter/material.dart';
//commento
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: LoginPage.route,
        onGenerateRoute: (settings) {
          if (settings.name == LoginPage.route) {
            return MaterialPageRoute(
                builder: (context) => LoginPage(title: 'Login UI'));
          } else if (settings.name == HomePage.route) {
            return MaterialPageRoute(builder: ((context) => HomePage()));
          } else {
            return null;
          }
        });
  }
}

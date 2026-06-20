import 'package:first_app/pages/00_gridpage.dart';
import 'package:first_app/pages/01_myhomepage.dart';
import 'package:first_app/pages/02_listpage.dart';
import 'package:first_app/pages/03_formpage.dart';
import 'package:first_app/pages/04_form_two_page.dart';
import 'package:first_app/pages/99_blankpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.green),
      ),
      initialRoute: '/0',
      routes: {
        '/0': (context) => GridPage(),
        '/1': (context) => MyHomePage(title: 'Home - Winai'),
        '/2': (context) => ListPage(),
        '/3': (context) => FormPage(),
        '/4': (context) => FormTwoPage(),
        '/5': (context) => BlankPage(),
      },
    );
  }
}

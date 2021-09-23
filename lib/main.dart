import 'package:flutter/material.dart';
import 'package:register_people/screens/home.dart';
import 'package:register_people/screens/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro de Pessoas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => PeopleList(title: 'Pessoas cadastradas'),
        '/register': (context) => RegisterPeople(title: 'Detalhes da pessoa'),
      },
    );
  }
}


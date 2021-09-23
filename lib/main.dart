import 'package:flutter/material.dart';
import 'package:register_people/database/database.dart';
import 'package:register_people/screens/home.dart';
import 'package:register_people/screens/register.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(
    db: await $FloorDatabaseApp.databaseBuilder('people_database.db').build()
  ));
}

class MyApp extends StatelessWidget {

  final DatabaseApp db;

  const MyApp({ Key? key, required this.db }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro de Pessoas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => PeopleList(title: 'Pessoas cadastradas', db: db),
        '/register': (context) => RegisterPeople(title: 'Detalhes da pessoa',  db: db),
      },
    );
  }
}


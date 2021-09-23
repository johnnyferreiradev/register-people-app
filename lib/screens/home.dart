
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:register_people/database/database.dart';

class PeopleList extends StatefulWidget {
  final DatabaseApp db;

  PeopleList({Key? key, required this.title,  required this.db}) : super(key: key);

  final String title;

  @override
  _PeopleListState createState() => _PeopleListState();
}

class _PeopleListState extends State<PeopleList> {
  final itens = List<String>.generate(50, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Fulano de tal - 99999999'),
            subtitle: Text('Rua de fulano de tal'),
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Beltrano de tal - 11111111'),
            subtitle: Text('Rua de beltrano de tal'),
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Sicrano de tal - 22222222'),
            subtitle: Text('Rua de sicrano de tal'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed('/register'),
        tooltip: 'Nova pessoa',
        child: Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:register_people/database/database.dart';
import 'package:register_people/model/people.dart';

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
          FutureBuilder<List<People>>(
            future: widget.db.peopleRepositoryDAO.getAll(),
            builder: (context, snapshot){
              return snapshot.hasData
                ? ListView.builder(
                   scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(Icons.people),
                      title: Text('${snapshot.data![index].name} - ${snapshot.data![index].phone}'),
                      subtitle: Text(snapshot.data![index].address),
                    );
                  }
                )
                : Center(
                  child: Text('Nenhuma pessoa cadastrada'),
                );
            },
          )
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
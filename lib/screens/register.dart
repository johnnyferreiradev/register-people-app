
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:register_people/database/database.dart';
import 'package:register_people/model/people.dart';

class RegisterPeople extends StatefulWidget {
  final DatabaseApp db;

  RegisterPeople({Key? key, required this.title,  required this.db}) : super(key: key);

  final String title;

  @override
  _RegisterPeopleState createState() => _RegisterPeopleState(db: db);
}

class _RegisterPeopleState extends State<RegisterPeople> {
  final DatabaseApp db;

  _RegisterPeopleState( {required this.db });

  TextEditingController _nameController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _addressController = new TextEditingController();

  void registerPeople(context) {
    if (_nameController.text.isNotEmpty && _phoneController.text.isNotEmpty && _addressController.text.isNotEmpty) {
      db.peopleRepositoryDAO.insertItem(new People(
        createdAt: DateTime.now().toUtc().toString(),
        name: _nameController.text,
        phone: _phoneController.text,
        address: _addressController.text,
      ));

       Navigator.of(context).pushNamed('/');
    }
  }

  TextField createTextField(String text, TextEditingController controller) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: text,
        border: OutlineInputBorder(),
        labelStyle: TextStyle(
          fontSize: 14,
          color: Colors.blue,
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('Opa = $context');

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: createTextField('Nome:', _nameController),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: createTextField('Número de contato:', _phoneController),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: createTextField('Endereço:', _addressController),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => registerPeople(context),
        tooltip: 'Salvar',
        child: Icon(Icons.save),
      ),
    );
  }
}
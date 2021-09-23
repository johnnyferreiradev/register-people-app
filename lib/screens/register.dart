
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterPeople extends StatefulWidget {
  RegisterPeople({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _RegisterPeopleState createState() => _RegisterPeopleState();
}

class _RegisterPeopleState extends State<RegisterPeople> {

  TextEditingController _nameController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _addressController = new TextEditingController();

  void registerPeople() {
    setState(() {
      
    });
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
        onPressed: registerPeople,
        tooltip: 'Salvar',
        child: Icon(Icons.save),
      ),
    );
  }
}
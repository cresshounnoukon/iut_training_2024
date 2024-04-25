import 'package:flutter/material.dart';
import 'package:training/common/I_button.dart';
import 'package:training/common/i_input.dart';
import 'package:training/models/person_dart.dart';

class FriendFormPage extends StatefulWidget {
  const FriendFormPage({super.key});

  @override
  State<FriendFormPage> createState() => _FriendFormPageState();
}

class _FriendFormPageState extends State<FriendFormPage> {
  final _formKey = GlobalKey<FormState>();
  final Person person= Person();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Friend creation"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              IIinput(
                name: 'Nom',

                validator: (value) {
                  if (value!.isEmpty) {
                    return " Champ obligatoire";
                  }
                },
                onSaved: (value) {

                 // print("Valeur à sauvegarder $value");
                  person.name=value;

                },

                prefixIcon: Icon(Icons.person),
                suffixIcon: Icon(Icons.access_time_filled),
              ),
             SizedBox(height: 10,),
              IIinput(
                name: 'Prenom',

                validator: (value) {
                  if (value!.isEmpty) {
                    return " Champ obligatoire";
                  }
                },
                onSaved: (value) {

                  // print("Valeur à sauvegarder $value");
                  person.surname=value;

                },

                prefixIcon: Icon(Icons.person),
                suffixIcon: Icon(Icons.access_time_filled),
              ),
              SizedBox(height: 10,),
              IIinput(
                name: 'Date de naissance',

                validator: (value) {
                  if (value!.isEmpty) {
                    return " Champ obligatoire";
                  }
                },
                onSaved: (value) {

                  // print("Valeur à sauvegarder $value");
                  person.birthDate=value;

                },

                prefixIcon: Icon(Icons.person),
                suffixIcon: Icon(Icons.access_time_filled),
              ),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: IButton(
          onPressed: () {
          if(  _formKey.currentState!.validate()){
            _formKey.currentState!.save();
           Navigator.pop(context, person);
          }
          },
          text: 'Se connecter',
        ),
      ),
    );
  }
}

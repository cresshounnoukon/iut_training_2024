import 'package:flutter/material.dart';

class FormWidgetPage extends StatefulWidget {
  const FormWidgetPage({super.key});

  @override
  State<FormWidgetPage> createState() => _FormWidgetPageState();
}

class _FormWidgetPageState extends State<FormWidgetPage> {
  bool enabled = false;

  double _sliderValue = 10.0;
  DateTime? birthdate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Friend creation"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    label: Text("Nom"),
                    hintText: 'Nom',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    // prefix: Icon(Icons.person),
                    prefixIcon: Icon(Icons.person),
                    suffixIcon: Icon(Icons.remove_red_eye),
                    fillColor: Colors.green.shade50,
                    filled: true),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    label: Text("Prenom"),
                    hintText: 'Prénom(s)',
                    border: OutlineInputBorder()),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                obscureText: true,
                obscuringCharacter: "#",
                decoration: InputDecoration(
                    label: Text("Mot de passe"), border: OutlineInputBorder()),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              CheckboxListTile(
                value: true,
                onChanged: (value) {},
                controlAffinity: ListTileControlAffinity.leading,
                title: Text("J'accepte les conditions"),
              ),
              RadioListTile(
                title: Text("Feminin"),
                value: "value",
                groupValue: "value",
                onChanged: (value) {
                  print(value);
                },
              ),
              SwitchListTile(
                value: enabled,
                onChanged: (value) {
                  enabled = value;
                  setState(() {});
                },
                controlAffinity: ListTileControlAffinity.leading,
                title: Text("Activez la connexion"),
              ),
              Slider(
                value: _sliderValue,
                min: 0.0,
                max: 100.0,
                activeColor: Colors.blue,
                label: "Pourcentage",
                divisions: 10,
                onChanged: (value) {
                  setState(() {
                    _sliderValue = value;
                  });
                },
              ),
              ListTile(
                title: Text("Date de naissance"),
                subtitle: Text("$birthdate"),
                trailing: Icon(Icons.calendar_month),
                onTap: () async {
                  birthdate = await showDatePicker(
                      cancelText: "Annuler",
                      confirmText: "Confirmer",
                      barrierColor: Colors.green.shade50,
                      context: context,
                      firstDate: DateTime(1990),
                      lastDate: DateTime.now());
                  setState(() {});
                },
              ),
              ListTile(
                title: Text("Période de réservatipn"),
                subtitle: Text("A définr"),
                trailing: Icon(Icons.calendar_month),
                onTap: () async {
               var bookPeriod= await   showDateRangePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2024, 10));
               print(bookPeriod);
                },
              ),

              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Message à afficher'),
                      duration: Duration(seconds: 2), // Durée pendant laquelle le SnackBar est affiché
                    ),
                  );
                },
                child: Text('Afficher le SnackBar'),
              ),
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text('Informations supplémentaires'),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Fermer'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Text('Afficher le bas de page'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

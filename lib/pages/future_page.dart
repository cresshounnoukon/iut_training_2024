import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FuturePage extends StatefulWidget {
  FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  List <File> files = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FUTURE"),
        actions: [
          IconButton(
              onPressed: () {
                takePicture();
              },
              icon: Icon(Icons.photo))
        ],
      ),
      body: ListView(
        children: files.map((e) => Container(
          height: 200,
          margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: FileImage(
                  e,
                ),
                fit: BoxFit.cover
              )
            ),
            child: Column(
              children: [
                Text("Texte que je veux",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 36.0
                ),),
                Text("Autre texte",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 36.0
                ),),
              ],
            )
        )).toList()
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          /* fetchData().then((value) {
            print(value);
            print("Bonjour mes camarades");// Affiche : Data loaded successfully!
          });*/
          var data = await fetchData();
          print(data);

          print("Bonjour tout le monde");
        },
      ),
    );
  }

  Future<String> fetchData() {
    return Future.delayed(Duration(seconds: 2), () {
      return 'Data loaded successfully!';
    });
  }

  void takePicture() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    print("Image ${image!.path}");
    var file= File(image.path);
    files.add(file);
    setState(() {
      
    });

  }
}

import 'package:flutter/material.dart';

import '../models/person_dart.dart';

class FriendPage extends StatelessWidget {
  final List<Person> friends;

  FriendPage({super.key, required this.friends});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Friends"),
      ),

      body: ListView(
        children: friends.map((person) => ListTile(
          title: Text("${person.name} ${person.surname}"),
          subtitle: Text("Bonjour comment vas-tu?"),
          leading: CircleAvatar(),
          onTap: () => Navigator.pop(context, person),

      )).toList(),
    )
    );
  }
}

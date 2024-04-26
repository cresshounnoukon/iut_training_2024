import 'package:flutter/material.dart';
import 'package:training/common/responsive_widegt.dart';
import 'package:training/models/person_dart.dart';
import 'package:training/pages/friend_form_page.dart';
import 'package:training/pages/friend_page.dart';

class FriendListPage extends StatefulWidget {
  const FriendListPage({super.key});

  @override
  State<FriendListPage> createState() => _FriendListPageState();
}

class _FriendListPageState extends State<FriendListPage> {
  String name = "";
  bool liked = false;
  List<Person> persons = [];
  List<Person> friends = [];

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(mobile: Scaffold(
      appBar: AppBar(
        title: Text("Iut 2024 Training"),
        actions: [
          IconButton(
              onPressed: () async {
                Person person = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FriendPage(
                        friends: friends,
                      ),
                    ));
                print(person.name);
                friends.remove(person);
                setState(() {});
              },
              icon: Icon(Icons.favorite))
        ],
      ),
      body:
      ListView(
        children: persons
            .map((person) => ListTile(
          title: Text("${person.name} ${person.surname}"),
          subtitle: Text("Bonjour comment vas-tu?"),
          leading: CircleAvatar(),
          trailing: Icon(
            Icons.favorite,
            color: checkIfExists(person) ? Colors.red : Colors.black,
          ),
          onTap: () {
            addFriend(person);
            setState(() {});
          },
        ))
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Person person = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FriendFormPage(),
              ));

          setState(() => persons.add(person));
        },
        child: Icon(Icons.add),
      ),
    ),

    );
  }

  bool checkIfExists(Person person) {
    return friends.contains(person);
  }

  void addFriend(Person person) {
    if (!checkIfExists(person)) {
      friends.add(person);
    } else {
      friends.remove(person);
    }
  }
}

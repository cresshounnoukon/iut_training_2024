import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:training/pages/post_page.dart';

import '../models/post.dart';

class PostListPage extends StatefulWidget {
  const PostListPage({super.key});

  @override
  State<PostListPage> createState() => _PostListPageState();
}

class _PostListPageState extends State<PostListPage> {
  List<Post> posts=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: posts.map((e) => ListTile(
          title: Text("${e.title}", style: TextStyle(
            fontWeight: FontWeight.bold
          ),),
          subtitle: Text("${e.title}"),
          leading: CircleAvatar(),
          onTap: () {

            Navigator.push(context, MaterialPageRoute(builder: (context) => PostPage(post: e),));
          },
        )).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          https: //jsonplaceholder.typicode.com/posts
          var response = await http
              .get(Uri.https("jsonplaceholder.typicode.com", '/posts'));

          if (response.statusCode >= 200 && response.statusCode <= 299) {
            //   print(response.body);
            var jsonResponse =
                convert.jsonDecode(response.body) as List<dynamic>;
          posts=  jsonResponse.map((element) {
              element = element as Map<String, dynamic>;
              Post post= Post.fromJson(element);

              print(post);
              return post;

            }).toList();
          setState(() {

          });


          /*  jsonResponse.forEach((element) {
              element = element as Map<String, dynamic>;
              print(element["userId"]);
            });
            */

          }
        },
      ),
    );
  }
}

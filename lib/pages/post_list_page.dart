import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/post.dart';
import 'post_page.dart';

class PostListPage extends StatefulWidget {
  const PostListPage({super.key});

  @override
  State<PostListPage> createState() => _PostListPageState();
}

class _PostListPageState extends State<PostListPage> {
  List<Post> posts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<Post>?>(
      future: fetchPosts(),
      builder: (BuildContext context, AsyncSnapshot<List<Post>?> snapshot) {
        print(snapshot.connectionState);
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return ListView(
              children: snapshot.data!
                  .map((e) => ListTile(
                        title: Text(
                          "${e.title}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("${e.title}"),
                        leading: CircleAvatar(),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PostPage(post: e),
                              ));
                        },
                      ))
                  .toList(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text("Assurez vous d'avoir une connection internet  activeUne erreur est survenue"),

            );
          }
        }

        return Center(
          child: Text("j'attends"),
        );
      },
    ));
  }

  Future<List<Post>?> fetchPosts() async {
    https: //jsonplaceholder.typicode.com/posts
    var response =
        await http.get(Uri.https("jsonplaceholder.typicode.com", '/posts'));

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      //   print(response.body);
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
      List<Post> posts = jsonResponse.map((element) {
        element = element as Map<String, dynamic>;
        Post post = Post.fromJson(element);
        return post;
      }).toList();
      return posts;
    }
  }
}

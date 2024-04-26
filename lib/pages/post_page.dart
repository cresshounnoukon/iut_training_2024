import 'package:flutter/material.dart';
import 'package:training/models/post.dart';

class PostPage extends StatelessWidget {
  final Post post;

  const PostPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Text("USER: ${post.userId}"),
          Text(
            "${post.title}",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            "${post.body}",
            style: TextStyle( color: Colors.black45),
          ),
        ],
      ),
    );
  }
}

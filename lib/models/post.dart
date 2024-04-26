import 'package:training/models/person_dart.dart';

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory Post.fromJson( Map<String, dynamic> data){
    return Post(userId: data["userId"],
        id: data["id"],
        title: data["title"],
        body: data["body"]);
  }

  Map<String, dynamic> toJson(){
    return {
      "userId":userId,
      "id":id,
      "title":title,
      "body":body,

    };
  }

  @override
  String toString() {
    return 'Post{userId: $userId, id: $id, title: $title, body: $body}';
  }
}

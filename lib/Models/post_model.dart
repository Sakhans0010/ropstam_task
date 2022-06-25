import 'package:flutter/cupertino.dart';

class PostModel with ChangeNotifier {
  int? id;
  int? userId;
  String? title;
  String? body;

  PostModel({
    this.id,
    this.userId,
    this.title,
    this.body,
  });

//gets the data into the an object from json from
  factory PostModel.fromJson(Map<String, dynamic> post) {
    return PostModel(
      id: post['id'],
      title: post['title'],
      userId: post['userId'],
      body: post['body'],
    );
  }
}

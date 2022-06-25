import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:ropstam_task/Models/post_model.dart';

class Posts with ChangeNotifier {
  List<PostModel> _posts = [];

  List<PostModel> get posts {
    return _posts;
  }

  static const baseUrl = 'https://jsonplaceholder.typicode.com/Posts';

  //gets and sets posts from the api
  Future<void> getPosts() async {
    try {
      var response = await http.get(
        Uri.parse(baseUrl),
      );
      if (response.statusCode == 200) {
        final extractedData = json.decode(response.body) as List<dynamic>;

        //dummy list of posts

        List<PostModel> _loadedPosts = [];

        //to go through all the data got in the  response
        extractedData.forEach((post) {
          _loadedPosts.add(PostModel.fromJson(post));
        });
        _posts = _loadedPosts;

        notifyListeners();
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print('An Error Occurred While fetching post $e');
      throw Exception(e);
    }
  }
}

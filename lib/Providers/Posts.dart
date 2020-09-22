import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/Models/models.dart';

class PostsProvider with ChangeNotifier {
  List<Post> postsList = List();

  void setPost(List<Post> data) {
    postsList = data;
  }
}

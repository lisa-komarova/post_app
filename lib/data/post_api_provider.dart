import 'dart:convert';

import 'package:post_app/models/post.dart';
import 'package:http/http.dart' as http;

///fetches the data from jsonplaceholder and parses it into the list of posts
class PostProvider {
  Future<List<Post>> fetchPosts() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      final List<dynamic> postsJson = jsonDecode(response.body);
      return postsJson.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception();
    }
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:bloc_stmgt/model/post_model.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  Future<List<postModel>> fetchPost() async {
    try {
      final response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body) as List;
        return body.map((e) {
          return postModel(
              id: e["id"] as int,
              postId: e["postId"] as int,
              email: e["email"] as String,
              body: e["body"] as String);
        }).toList();
      } else {}
    } on SocketException {
      throw Exception("error while fetching data");
    }

    throw Exception('error while fetching data');
  }
}

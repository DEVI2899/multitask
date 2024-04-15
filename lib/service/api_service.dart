import 'dart:convert';

import 'package:http/http.dart' as http;
import '../model/user_details.dart';

class ApiService{
  Future<List<Userdetails>> fetchItems() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => Userdetails.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load items');
    }
  }
}
import 'dart:convert';

import 'package:harry_potter/model/character.dart';
import "package:http/http.dart" as http;

class StudentService {
  Future<List<Character>> fetchStudents() async {
    List<Character> list = List<Character>();
    http.Response response =
        await http.get("https://hp-api.herokuapp.com/api/characters/students");

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      list = json.map<Character>((item) => Character.fromJson(item)).toList();
      list.sort((a, b) => a.name.compareTo(b.name));
      return list;
    } else
      return null;
  }
}
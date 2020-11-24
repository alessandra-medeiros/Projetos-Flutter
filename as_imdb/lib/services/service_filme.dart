import 'dart:convert';
import 'package:as_imdb/models/filme.dart';
import 'package:as_imdb/models/filme_info.dart';
import 'package:http/http.dart' as http;

const API_KEY = "845d2af1";
const API_URL = "http://www.omdbapi.com/?apikey=";

Future<List<Filme>> searchMovies(keyword) async {
  final response = await http.get('$API_URL$API_KEY&s=$keyword');

  if (response.statusCode == 200) {
    Map data = json.decode(response.body);

    if (data['Response'] == "True") {
      var list = (data['Search'] as List)
          .map((item) => new Filme.fromJson(item))
          .toList();
      return list;
    } else {
      throw Exception(data['Error']);
    }
  } else {
    throw Exception('Something went wrong !');
  }
}

Future<FilmeInfo> getMovie(movieId) async {
  final response = await http.get('$API_URL$API_KEY&i=$movieId');

  if (response.statusCode == 200) {
    Map data = json.decode(response.body);

    if (data['Response'] == "True") {
      return FilmeInfo.fromJSON(data);
    } else {
      throw Exception(data['Error']);
    }
  } else {
    throw Exception('Something went wrong !');
  }
}
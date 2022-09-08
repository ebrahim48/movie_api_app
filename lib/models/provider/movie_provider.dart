import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

import '../movie_model.dart';
class MovieProvider extends ChangeNotifier{
  MovieModel? movieModel;


  void getMoviesData() async {
    final uri = Uri.parse(
        "https://yts.mx/api/v2/list_movies.json");

    try {
      final response = await get(uri);
      final map = json.decode(response.body);
      if (response.statusCode == 200) {
        movieModel = MovieModel.fromJson(map);
        print("movies  data: ${movieModel!.data!.movieCount}");
        notifyListeners();
      } else {
        print(map["message"]);
      }
    } catch (error) {
      rethrow;
    }
  }
}
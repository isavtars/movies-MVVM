import 'package:demo_mvvp/viewModel/movie_view_model.dart';
import 'package:demo_mvvp/viewModel/web_service.dart';
import 'package:flutter/material.dart';


class MovieListViewModel extends ChangeNotifier {
  List<MovieViewModel> movies =[];
  Future<void> fetchMovies(String keyword) async {
    final results =  await Webservice().fetchMovies(keyword);
    movies = results.map((item) => MovieViewModel(movie: item)).toList();
    notifyListeners();
  }
}


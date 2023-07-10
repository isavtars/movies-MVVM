import 'dart:convert';
import 'package:demo_mvvp/model/movies.dart';
import 'package:http/http.dart' as http;


class Webservice {
  Future<List<Movie>> fetchMovies(String keyword) async {
    /// this api endpoint is not active at this time,
    /// use own version of api url

    final url = Uri.parse("http://www.omdbapi.com/?s=$keyword&apikey=eb0d5538");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable json = body["Search"];
      return json.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Unable to perform request!");
    }
  }
}

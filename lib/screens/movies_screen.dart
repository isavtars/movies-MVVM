import 'package:demo_mvvp/viewModel/movies_list_view_model.dart';
import 'package:demo_mvvp/widget/movies_list.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({Key? key}) : super(key: key);

  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {

  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<MovieListViewModel>(context, listen: false).fetchMovies("iron man");
/// you can use anything you like or not use anything here.
/// I call it just to have a content on the screen rather than having a blank screen
  }

  @override
  Widget build(BuildContext context) {
    final movieName = Provider.of<MovieListViewModel>(context);
    return Scaffold(
        appBar: AppBar(
            title: const Text("Movies")
        ),
        body: Container(
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(children: <Widget>[
              Container(
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: TextField(
                  controller: _controller,
                  onSubmitted: (value) {
                    if(value.isNotEmpty) {
                      movieName.fetchMovies(value);
                      _controller.clear();
                    }
                  },
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      hintText: "Search here",
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none
                  ),

                ),
              ),
              Expanded(
                  child: MovieList(movies: movieName.movies))
              ///we will create this further down
            ],
            ),
        ),
    );
  }
}
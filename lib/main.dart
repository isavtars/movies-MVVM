import 'package:demo_mvvp/screens/movies_screen.dart';
import 'package:demo_mvvp/viewModel/movies_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Reference : https://www.appsdeveloperblog.com
/// demo data: http://www.omdbapi.com

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Movies MVVM Example",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal),
      home: ChangeNotifierProvider(
        create: (context) => MovieListViewModel(),
        child: const MovieListPage(),
      ),
    );
  }
}

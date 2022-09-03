import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../main.dart';
import '../models/api_data.dart';
import '../models/return_movies_by_genres.dart';

class MoviesByGenres extends StatefulWidget {
  String genre = "";
  MoviesByGenres({Key? key, required this.genre}) : super(key: key);

  @override
  State<MoviesByGenres> createState() => _MoviesByGenresState();
}

class _MoviesByGenresState extends State<MoviesByGenres> {
  List moviesList = [];

  @override
  void initState() {
    super.initState();

    loadMovies();
  }

  loadMovies() async {
    Map movies = await ApiData.tmdbLogs.v3.discover.getMovies(
      withGenres: widget.genre,
    );

    setState(() {
      moviesList = movies['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.genre);
    return MyApp(
      displayWidget: ListView(
        children: [
          ReturnMoviesByGenre(
            moviesList: moviesList,
          ),
        ],
      ),
    );
  }
}

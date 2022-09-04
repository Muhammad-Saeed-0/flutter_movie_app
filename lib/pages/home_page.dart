import 'package:flutter/material.dart';
import 'package:movie_app/main.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../models/api_data.dart';
import '../models/return_movies.dart';
import '../models/return_movies_genre.dart';

class HomePage extends StatefulWidget {
  String? genre;

  HomePage({this.genre, Key? key}) : super(key: key) {
    genre ??= "Action";
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //
  List nowPlayingMoviesList = [];
  List trendingMoviesList = [];
  List topRateMoviesList = [];
  List popularMoviesList = [];
  List tvTopRateList = [];
  List genresLis = [];
  List moviesList = [];

  //
  @override
  void initState() {
    super.initState();

    loadNowPlayingMovies();
    loadTrendingMovies();
    loadToRateMovies();
    loadPopularMovies();
    loadTVTopRate();
    loadGenresMovies();
    loadMoviesList();
  }

  @override
  Widget build(BuildContext context) {
    return MyApp(
      displayWidget: ListView(
        children: [
          ReturnMoviesGenre(genresLis: genresLis),
          ReturnMovies(
            list: moviesList,
            title: '${widget.genre} Movies',
          ),
          ReturnMovies(
            list: nowPlayingMoviesList,
            title: 'Now Playing Movies',
          ),
          ReturnMovies(
            list: trendingMoviesList,
            title: 'Trending Movies',
          ),
          ReturnMovies(
            list: topRateMoviesList,
            title: 'Top Rated Movies',
          ),
          ReturnMovies(
            list: popularMoviesList,
            title: 'Popular Movies',
          ),
          ReturnMovies(
            list: tvTopRateList,
            title: 'Top Rated TV Series',
          ),
        ],
      ),
    );
  }

  loadNowPlayingMovies() async {
    Map nowPlayingMovies = await ApiData.tmdbLogs.v3.movies.getNowPlaying();

    setState(() {
      nowPlayingMoviesList = nowPlayingMovies['results'];
    });
  }

  loadTrendingMovies() async {
    Map trendingMovies = await ApiData.tmdbLogs.v3.trending
        .getTrending(mediaType: MediaType.movie);
    print(trendingMovies['results']);

    setState(() {
      trendingMoviesList = trendingMovies['results'];
    });
  }

  loadToRateMovies() async {
    Map topRateMovies = await ApiData.tmdbLogs.v3.movies.getTopRated();

    setState(() {
      topRateMoviesList = topRateMovies['results'];
    });
  }

  loadPopularMovies() async {
    Map popularMovies = await ApiData.tmdbLogs.v3.movies.getPopular();

    setState(() {
      popularMoviesList = popularMovies['results'];
    });
  }

  loadTVTopRate() async {
    Map tvTopRate = await ApiData.tmdbLogs.v3.tv.getTopRated();

    setState(() {
      tvTopRateList = tvTopRate['results'];
    });
  }

  loadGenresMovies() async {
    Map genres = await ApiData.tmdbLogs.v3.genres.getMovieList();

    setState(() {
      genresLis = genres['genres'];
    });
  }

  loadMoviesList() async {
    Map movies =
        await ApiData.tmdbLogs.v3.discover.getMovies(withGenres: widget.genre);

    setState(() {
      moviesList = movies['results'];
    });
  }
}

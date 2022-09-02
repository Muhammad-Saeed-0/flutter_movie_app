import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../models/api_data.dart';
import '../models/return_movies.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //
  List trendingMoviesList = [];
  List topRateMoviesList = [];
  List tvTopRateList = [];

  //
  @override
  void initState() {
    super.initState();

    loadTrendingMovies();
    loadToRateMovies();
    loadTVTopRate();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ReturnMovies(
          list: trendingMoviesList,
          title: 'Trending Movies',
        ),
        ReturnMovies(
          list: topRateMoviesList,
          title: 'Top Rated Movies',
        ),
        ReturnMovies(
          list: tvTopRateList,
          title: 'Top Rated TV Series',
          name: 'original_name',
        ),
      ],
    );
  }

  loadTrendingMovies() async {
    Map trendingMovies = await ApiData.tmdbLogs.v3.trending.getTrending();

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

  loadTVTopRate() async {
    Map tvTopRate = await ApiData.tmdbLogs.v3.tv.getTopRated();

    setState(() {
      tvTopRateList = tvTopRate['results'];
    });
  }
}

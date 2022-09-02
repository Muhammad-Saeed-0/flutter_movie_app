import 'package:flutter/material.dart';

import '../models/api_data.dart';
import '../models/trending_movies.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //
  late List trendingMoviesList;
  late List topRateMoviesList;
  late List tvTopRateList;

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
        TrendingMovies(
          trendingMoviesList: trendingMoviesList,
        )
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

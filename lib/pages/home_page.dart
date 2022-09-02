import 'package:flutter/material.dart';

import '../models/api_data.dart';

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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Image.asset(
              'assets/images/img.png',
              width: 150,
              height: 90,
            ),
          ),
        ),
      ),
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

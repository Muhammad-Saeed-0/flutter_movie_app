import 'package:flutter/material.dart';
import 'package:movie_app/utilities/text_design.dart';

class TrendingMovies extends StatelessWidget {
  final List trendingMoviesList;

  const TrendingMovies({Key? key, required this.trendingMoviesList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextDesign(text: 'Trending Movies'),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) {
                  return InkWell(
                    onTap: () {},
                    child: SizedBox(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height: 190,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  "http://image.tmdb.org/t/p/w500${trendingMoviesList[i]['poster_path']}",
                                ),
                              ),
                            ),
                          ),
                          TextDesign.subTitle(
                            text: trendingMoviesList[i]['title'] ?? 'No Title',
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: trendingMoviesList.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

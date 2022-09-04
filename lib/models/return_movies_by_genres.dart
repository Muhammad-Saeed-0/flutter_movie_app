import 'package:flutter/material.dart';
import 'package:movie_app/pages/description.dart';
import 'package:movie_app/utilities/text_design.dart';

import '../pages/get_movies_with_genres.dart';
import 'api_data.dart';

class ReturnMoviesByGenre extends StatelessWidget {
  List moviesList = [];

  ReturnMoviesByGenre({Key? key, required this.moviesList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
          // TextDesign(text: title),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: 600,
              child: moviesList.isEmpty
                  ? const CircularProgressIndicator()
                  : ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, i) => InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Description(
                                    name: moviesList[i]['title'],
                                    description: moviesList[i]['overview'],
                                    bannerUrl:
                                        "https://image.tmdb.org/t/p/w500${moviesList[i]['backdrop_path'] ?? moviesList[i]['poster_path']}",
                                    posterUrl:
                                        "https://image.tmdb.org/t/p/w500${moviesList[i]['poster_path']}",
                                    vote: moviesList[i]['vote_average']
                                        .toString(),
                                    launchOn: moviesList[i]['release_date'])),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Container(
                                height: 400,
                                width: 300,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      "https://image.tmdb.org/t/p/w500${moviesList[i]['poster_path']}",
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: TextDesign.subTitle(
                                  text: moviesList[i]['title'],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      itemCount: moviesList.length,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

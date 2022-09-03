import 'package:flutter/material.dart';
import 'package:movie_app/pages/description.dart';
import 'package:movie_app/utilities/text_design.dart';

class ReturnMovies extends StatelessWidget {
  final List list;
  final String title;
  String? name;
  String? keyOfValue;
  String? banner;
  String? description;
  String? vote;
  String? launchOn;

  ReturnMovies({
    this.name,
    this.keyOfValue,
    this.banner,
    this.description,
    this.vote,
    Key? key,
    required this.list,
    required this.title,
  }) : super(key: key) {
    keyOfValue ??= 'poster_path';
    name ??= 'title';
    banner ??= 'backdrop_path';
    description ??= 'overview';
    vote ??= 'vote_average';
    launchOn ??= 'release_date';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextDesign(text: title),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: 250,
              child: list.isEmpty
                  ? const CircularProgressIndicator()
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, i) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Description(
                                      name: list[i][name],
                                      description: list[i][description],
                                      bannerUrl:
                                          "https://image.tmdb.org/t/p/w500${list[i][banner] ?? list[i][keyOfValue]}",
                                      posterUrl:
                                          "https://image.tmdb.org/t/p/w500${list[i][keyOfValue]}",
                                      vote: list[i][vote].toString(),
                                      launchOn: list[i][launchOn])),
                            );
                          },
                          child: SizedBox(
                            width: 180,
                            child: Column(
                              children: [
                                Container(
                                  height: 250,
                                  width: 160,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        "https://image.tmdb.org/t/p/w500${list[i][keyOfValue]}",
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: list.length,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

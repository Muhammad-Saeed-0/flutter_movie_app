import 'package:flutter/material.dart';
import 'package:movie_app/pages/home_page.dart';

class ReturnMoviesGenre extends StatelessWidget {
  List genresLis = [];

  ReturnMoviesGenre({Key? key, required this.genresLis}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: SizedBox(
              height: 50,
              child: genresLis.isEmpty
                  ? const CircularProgressIndicator()
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, i) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(
                                  genre: genresLis[i]['name'],
                                ),
                              ),
                            );
                          },
                          child: SizedBox(
                            width: 150,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    height: 30,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.white,
                                    ),
                                    child: Center(
                                      child: Text(genresLis[i]['name']),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: genresLis.length,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

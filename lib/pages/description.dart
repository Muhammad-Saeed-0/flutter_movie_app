import 'package:flutter/material.dart';
import 'package:movie_app/utilities/text_design.dart';

import '../main.dart';

class Description extends StatelessWidget {
  String? name, description, bannerUrl, posterUrl, vote, launchOn;
  var no_date = const Text(
    'No Date',
    style: TextStyle(color: Colors.yellow),
  );

  Description(
      {Key? key,
      this.name,
      this.description,
      this.bannerUrl,
      this.posterUrl,
      this.vote,
      this.launchOn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyApp(
      displayWidget: ListView(
        children: [
          SizedBox(
            height: 250,
            child: Stack(
              children: [
                Positioned(
                  child: SizedBox(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      bannerUrl!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 20,
                  child: Container(
                    color: Colors.black,
                    padding: const EdgeInsets.all(10),
                    child: TextDesign.subTitle(
                      text: 'Rating: $vote ⭐',
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextDesign.subTitle(text: name ?? 'No Title'),
                TextDesign.subTitle(
                    text: "Release On: ${launchOn ?? '  ~~ No Date ~~'}"),
                Row(
                  children: [
                    Image.network(
                      posterUrl!,
                      height: 200,
                      width: 100,
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextDesign.subTitle(
                          text: description ?? 'No Description',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

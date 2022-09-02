import 'package:flutter/material.dart';
import 'package:movie_app/utilities/text_design.dart';

class Description extends StatelessWidget {
  String? name, description, bannerUrl, posterUrl, vote, launchOn;

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
    return ListView(
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
                  child: Text(
                    'Rating: $vote ⭐',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:app_filmes_darkweek/models/movie_detail_model.dart';
import 'package:flutter/material.dart';

class MovieDetailContentCredits extends StatelessWidget {
  MovieDetailModel? movie;

  MovieDetailContentCredits({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 50),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          movie?.overview ?? '',
          style: const TextStyle(
            fontSize: 14,
            height: 1.3,
          ),
        ),
      ),
    );
  }
}

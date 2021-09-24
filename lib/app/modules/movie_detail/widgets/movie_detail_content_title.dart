import 'package:app_filmes_darkweek/app/ui/theme_extensions.dart';
import 'package:app_filmes_darkweek/models/movie_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class MovieDetailContentTitle extends StatelessWidget {
  final MovieDetailModel? movie;

  const MovieDetailContentTitle({Key? key, required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            movie?.title ?? '',
            style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          RatingStars(
            value: (movie?.stars ?? 1) / 2,
            valueLabelVisibility: false,
            starColor: context
                .themeOrange, // tem q chamar ThemeExtension q foi criada por nós
            starSize: 14,
          ),
          const SizedBox(
            height: 10,
          ),

          // pode ser mais de um genero então tem que mapear
          Text(
            movie?.genres.map((e) => e.name).join(', ') ?? '',
            style: TextStyle(
              fontSize: 11,
              color: context.themeGrey,
            ),
          )
        ],
      ),
    );
  }
}
import 'package:app_filmes_darkweek/app/modules/movies/movies_controller.dart';
import 'package:app_filmes_darkweek/app/ui/widgets/movie_card.dart';
import 'package:app_filmes_darkweek/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesGroup extends GetView<MoviesController> {
  final String title;
  final List<MovieModel> movies;
  const MoviesGroup({Key? key, required this.title, required this.movies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 280,
            child: Obx(() {
              return ListView.builder(
                  shrinkWrap:
                      true, // recalcula o listView toda vez q abre tela, tem que usar quando está dentro de um column
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    var movie = movies[index];
                    return MovieCard(
                      movie: movie,
                      favoriteCallBack: () => controller.favoriteMovie(movie),
                    );
                  });
            }),
          ),
        ],
      ),
    );
  }
}

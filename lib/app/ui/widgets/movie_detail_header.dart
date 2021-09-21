import 'package:app_filmes_darkweek/app/modules/movie_detail/movie_detail_controller.dart';
import 'package:app_filmes_darkweek/models/movie_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieDetailHeader extends GetView<MovieDetailController> {
  final MovieDetailModel? movie;

  const MovieDetailHeader({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (movie != null) {
      return SizedBox(
        height: 278,
        child: ListView.builder(
            itemCount: movie!.urlImages.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final image = movie!.urlImages[index];
              return Padding(
                padding: const EdgeInsets.all(2),
                child: Image.network(image),
              );
            }),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

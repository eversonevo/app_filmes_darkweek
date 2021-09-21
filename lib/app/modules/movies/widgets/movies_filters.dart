import 'package:app_filmes_darkweek/app/modules/movies/movies_controller.dart';
import 'package:app_filmes_darkweek/app/modules/movies/widgets/filter_tag.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesFilters extends GetView<MoviesController> {
  const MoviesFilters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Obx(() => Row(
              children: controller.genres
                  .map((element) => FilterTag(
                        model: element,
                        onPressed: () =>
                            controller.filterMoviesByGenre(element),
                        selected:
                            controller.genreSelected.value?.id == element.id,
                      ))
                  .toList(),
            )),
      ),
    );
  }
}

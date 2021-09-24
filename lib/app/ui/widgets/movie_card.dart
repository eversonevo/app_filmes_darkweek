import 'package:app_filmes_darkweek/app/ui/filmes_app_icon_icons.dart';
import 'package:app_filmes_darkweek/app/ui/theme_extensions.dart';
import 'package:app_filmes_darkweek/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class MovieCard extends StatelessWidget {
  MovieModel movie;
  MovieCard({Key? key, required this.movie, required this.favoriteCallBack})
      : super(key: key);

  final DateFormat dateFormat = DateFormat('dd/MM/y');
  final VoidCallback favoriteCallBack;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/movie/detail', arguments: movie.id);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        width: 158,
        height: 280,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      clipBehavior: Clip.antiAlias,
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w200/${movie.posterPath}',
                        width: 148,
                        height: 184,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    movie.title,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow
                        .ellipsis, //insere 3 pontinhos se texto for muito grande
                    maxLines: 2,
                  ),
                  Text(
                    dateFormat.format(DateTime.parse(movie.releaseDate)),
                    style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 50,
              right: -5,
              child: Material(
                elevation: 5, //elevação da bolinha redonda
                shape: const CircleBorder(),
                clipBehavior: Clip.antiAlias,
                child: SizedBox(
                  height: 30,
                  child: IconButton(
                    onPressed: favoriteCallBack,
                    iconSize: 13,
                    icon: Icon(
                      movie.favorite
                          ? FilmesAppIcon.heart
                          : FilmesAppIcon.heart_empty,
                      color:
                          movie.favorite ? context.themeRed : context.themeGrey,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

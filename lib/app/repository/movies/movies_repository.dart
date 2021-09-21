import 'package:app_filmes_darkweek/models/movie_detail_model.dart';
import 'package:app_filmes_darkweek/models/movie_model.dart';

abstract class MoviesRepository {
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRetad();
  Future<MovieDetailModel?> getDetail(int id);
}

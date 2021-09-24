import 'package:app_filmes_darkweek/models/movie_detail_model.dart';
import 'package:app_filmes_darkweek/models/movie_model.dart';

abstract class MoviesRepository {
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRetad();
  Future<MovieDetailModel?> getDetail(int id);

  // pode separar em outro repository
  Future<void> addOrRemoveFavorite(String userId, MovieModel movie);
  Future<List<MovieModel>> getFavoritiesmovies(String userId);
}

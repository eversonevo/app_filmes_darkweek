import 'package:app_filmes_darkweek/app/repository/movies/movies_repository.dart';
import 'package:app_filmes_darkweek/models/movie_detail_model.dart';
import 'package:app_filmes_darkweek/models/movie_model.dart';

import './movies_service.dart';

class MoviesServiceImpl implements MoviesService {
  final MoviesRepository _moviesRepository;

  MoviesServiceImpl({required MoviesRepository moviesRepository})
      : _moviesRepository = moviesRepository;

  @override
  Future<List<MovieModel>> getPopularMovies() =>
      _moviesRepository.getPopularMovies();

  @override
  Future<List<MovieModel>> getTopRetad() => _moviesRepository.getTopRetad();

  @override
  Future<MovieDetailModel?> getDetail(int i) => _moviesRepository.getDetail(i);
}

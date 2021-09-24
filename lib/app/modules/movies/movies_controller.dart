import 'package:app_filmes_darkweek/app/application/auth/auth_service.dart';
import 'package:app_filmes_darkweek/app/services/genres/genres_service.dart';
import 'package:app_filmes_darkweek/app/services/movies/movies_service.dart';
import 'package:app_filmes_darkweek/app/ui/messages/messages_mixin.dart';
import 'package:app_filmes_darkweek/models/genre_model.dart';
import 'package:app_filmes_darkweek/models/movie_model.dart';
import 'package:get/get.dart';

class MoviesController extends GetxController with MessagesMixin {
  final GenresService _genresService;
  final MoviesService _moviesService;
  final AuthService _authService;

  MoviesController({
    required GenresService genresService,
    required MoviesService moviesService,
    required AuthService authService,
  })  : _genresService = genresService,
        _authService = authService,
        _moviesService = moviesService;

  final _message = Rxn<MessageModel>();
  final genres = <GenreModel>[].obs;
  final popularMovies = <MovieModel>[].obs;
  final topRatedMovies = <MovieModel>[].obs;

  var _popularMoviesOriginal = <MovieModel>[];
  var _topRatedMoviesOriginal = <MovieModel>[];

  final genreSelected = Rxn<GenreModel>();

  //List<GenreModel> get genres => _genres;

  @override
  void onInit() {
    super.onInit();
    messageListener(_message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      final genresAPI = await _genresService.getGenres();
      genres.assignAll(genresAPI);
      // limpa a observavel genres e renova
      await getMovies();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<void> getMovies() async {
    try {
      var popularMoviesData = await _moviesService.getPopularMovies();
      var topRatedMoviesData = await _moviesService.getTopRetad();
      final favorites = await getFavorites();

      popularMoviesData = popularMoviesData.map((m) {
        if (favorites.containsKey(m.id)) {
          return m.copyWith(favorite: true);
        } else {
          return m.copyWith(favorite: false);
        }
      }).toList();

      topRatedMoviesData = topRatedMoviesData.map((m) {
        if (favorites.containsKey(m.id)) {
          return m.copyWith(favorite: true);
        } else {
          return m.copyWith(favorite: false);
        }
      }).toList();

      popularMovies.assignAll(popularMoviesData);
      _popularMoviesOriginal = popularMoviesData;
      topRatedMovies.assignAll(topRatedMoviesData);
      _topRatedMoviesOriginal = popularMoviesData;
    } catch (e, s) {
      // ignore: avoid_print
      print(e);
      // ignore: avoid_print
      print(s);
      _message(MessageModel.error(
          title: 'Erro', message: 'Erro ao buscar dados da página'));
    }
  }

  void filterByName(String title) {
    if (title.isNotEmpty) {
      var newPopularMovies = _popularMoviesOriginal.where((movie) {
        return movie.title.toLowerCase().contains(title.toLowerCase());
      });

      var newTopRatedMovies = _topRatedMoviesOriginal.where((movie) {
        return movie.title.toLowerCase().contains(title.toLowerCase());
      });

      popularMovies.assignAll(newPopularMovies);
      topRatedMovies.assignAll(newTopRatedMovies);
    } else {
      popularMovies.assignAll(_popularMoviesOriginal);
      topRatedMovies.assignAll(_topRatedMoviesOriginal);
    }
  }

  void filterMoviesByGenre(GenreModel? genreModel) {
    var genreFilter = genreModel;
    if (genreFilter?.id == genreSelected.value?.id) {
      genreFilter = null;
    }
    genreSelected.value = genreFilter;

    if (genreFilter != null) {
      var newPopularMovies = _popularMoviesOriginal.where((movie) {
        return movie.genres.contains(genreFilter?.id);
      });

      var newTopRatedMovies = _topRatedMoviesOriginal.where((movie) {
        return movie.genres.contains(genreFilter?.id);
      });

      popularMovies.assignAll(newPopularMovies);
      topRatedMovies.assignAll(newTopRatedMovies);
    } else {
      popularMovies.assignAll(_popularMoviesOriginal);
      topRatedMovies.assignAll(_topRatedMoviesOriginal);
    }
  }

  Future<void> favoriteMovie(MovieModel movie) async {
    final user = _authService.user;
    if (user != null) {
      var newMovie = movie.copyWith(favorite: !movie.favorite);
      await _moviesService.addOrRemoveFavorite(user.uid, newMovie);
      await getMovies();
    }
  }

  Future<Map<int, MovieModel>> getFavorites() async {
    var user = _authService.user;
    if (user != null) {
      final favorites = await _moviesService.getFavoritiesmovies(user.uid);
      return <int, MovieModel>{
        for (var fav in favorites) fav.id: fav,
      };
    } else {
      return {};
    }
  }
}

import 'package:app_filmes_darkweek/app/modules/movies/movies_controller.dart';
import 'package:app_filmes_darkweek/app/repository/genres/genres_repository.dart';
import 'package:app_filmes_darkweek/app/repository/genres/genres_repository_impl.dart';
import 'package:app_filmes_darkweek/app/services/genres/genres_service.dart';
import 'package:app_filmes_darkweek/app/services/genres/genres_service_impl.dart';
import 'package:get/get.dart';

class MoviesBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GenresRepository>(
        () => GenresRepositoryImpl(restClient: Get.find()));

    Get.lazyPut<GenresService>(
        () => GenresServiceImpl(genresRepository: Get.find()));

    Get.lazyPut(() => MoviesController(
        genresService: Get.find(),
        moviesService: Get.find(),
        authService: Get.find()));
  }
}

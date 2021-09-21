import 'package:app_filmes_darkweek/app/services/movies/movies_service.dart';
import 'package:app_filmes_darkweek/app/ui/loader/loader_mixin.dart';
import 'package:app_filmes_darkweek/app/ui/messages/messages_mixin.dart';
import 'package:app_filmes_darkweek/models/movie_detail_model.dart';
import 'package:get/get.dart';

class MovieDetailController extends GetxController
    with LoaderMixin, MessagesMixin {
  final MoviesService _moviesService;

  var loading = false.obs;
  var message = Rxn<MessageModel>();
  var movie = Rxn<MovieDetailModel>();

  MovieDetailController({required MoviesService moviesService})
      : _moviesService = moviesService;

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messageListener(message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();

    try {
      final movieId = Get.arguments; // retorna o id clicado
      loading(true);

      final movieDetailData = await _moviesService.getDetail(movieId);
      movie.value = movieDetailData;
      loading(false);
    } catch (e, s) {
      print(e);
      print(s);
      loading(false);
      message(MessageModel.error(
          title: 'Erro', message: 'Erro ao buscar detalhe do filme'));
    }
  }
}

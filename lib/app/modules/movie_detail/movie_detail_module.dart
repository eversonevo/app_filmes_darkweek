import 'package:app_filmes_darkweek/app/modules/module.dart';
import 'package:app_filmes_darkweek/app/modules/movie_detail/movie_detail_bindings.dart';
import 'package:app_filmes_darkweek/app/modules/movie_detail/movie_detail_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class MovieDetailModule extends Module {
  @override
  List<GetPage> routers = [
    GetPage(
        name: '/movie/detail',
        page: () => const MovieDetailPage(),
        binding: MovieDetailBindings())
  ];
}

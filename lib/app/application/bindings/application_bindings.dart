import 'package:app_filmes_darkweek/app/application/auth/auth_service.dart';
import 'package:app_filmes_darkweek/app/application/rest_client/rest_client.dart';
import 'package:app_filmes_darkweek/app/repository/login/login_repository.dart';
import 'package:app_filmes_darkweek/app/repository/login/login_repository_implements.dart';
import 'package:app_filmes_darkweek/app/repository/movies/movies_repository.dart';
import 'package:app_filmes_darkweek/app/repository/movies/movies_repository_impl.dart';
import 'package:app_filmes_darkweek/app/services/login/login_services.dart';
import 'package:app_filmes_darkweek/app/services/login/login_services_impl.dart';
import 'package:app_filmes_darkweek/app/services/movies/movies_service.dart';
import 'package:app_filmes_darkweek/app/services/movies/movies_service_impl.dart';
import 'package:get/get.dart';

class ApplicationBindings implements Bindings {
  // TUDO O QUE ESTIVER NO APLICATION BINDINGS TEM QUE SER FENIX PARA SAIR DA MEMÓRIA
  // APENAS QUANDO O APP FECHAR

  @override
  void dependencies() {
    Get.lazyPut(() => RestClient(), fenix: true);
    Get.lazyPut<LoginRepository>(() => LoginRepositoryImplements(),
        fenix: true);
    Get.lazyPut<LoginService>(
        () => LoginServiceImpl(loginRepository: Get.find()),
        fenix: true);

    // inicializa o serviço do verificacao de autenticação pelo service
    Get.put(AuthService()).init();

    // quando for usar no app todo, declara no aplication, centraliza as coisas
    // restClient já está sendo chamado aqui então usa o Get.find() que o getx encontra
    Get.lazyPut<MoviesRepository>(
        () => MoviesRepositoryImpl(restClient: Get.find()),
        fenix: true);
    Get.lazyPut<MoviesService>(
        () => MoviesServiceImpl(moviesRepository: Get.find()),
        fenix: true);
  }
}

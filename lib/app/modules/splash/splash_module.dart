import 'package:app_filmes_darkweek/app/modules/module.dart';
import 'package:app_filmes_darkweek/app/modules/splash/splash_bindings.dart';
import 'package:app_filmes_darkweek/app/modules/splash/splash_page.dart';
import 'package:get/get.dart';

class SplashModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/',
      page: () => const SplashPage(),
      binding: SplashBindings(),
    ),
  ];
}

import 'package:app_filmes_darkweek/app/modules/favorites/favorites_bindings.dart';
import 'package:app_filmes_darkweek/app/modules/favorites/favorites_page.dart';
import 'package:app_filmes_darkweek/app/modules/home/home_controller.dart';
import 'package:app_filmes_darkweek/app/modules/movies/movies_bindings.dart';
import 'package:app_filmes_darkweek/app/modules/movies/movies_page.dart';
import 'package:app_filmes_darkweek/app/ui/filmes_app_icon_icons.dart';
import 'package:app_filmes_darkweek/app/ui/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          // context.themeRed foi criado uma função somente para cores do app
          // application / ui / themeextension quem for BuildCOntext pode enxergar
          selectedItemColor: context.themeRed,
          unselectedItemColor: Colors.grey,
          onTap: controller.goToPage,
          currentIndex: controller.pageIndex,

          items: [
            BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Filmes'),
            BottomNavigationBarItem(
                icon: Icon(FilmesAppIcon.hand_holding_heart),
                label: 'Favoritos'),
            BottomNavigationBarItem(
                icon: Icon(Icons.logout_outlined), label: 'Sair'),
          ],
        );
      }),

      /* ------ */
      body: Navigator(
        initialRoute: '/movies',
        key: Get.nestedKey(HomeController.NAVIGATOR_KEY),
        onGenerateRoute: (settings) {
          print('xxxxx' + settings.name.toString());
          switch (settings.name) {
            case '/movies':
              return GetPageRoute(
                settings: settings,
                page: () => MoviesPage(),
                binding: MoviesBindings(),
              );
            case '/favorites':
              return GetPageRoute(
                settings: settings,
                page: () => FavoritesPage(),
                binding: FavoritesBindings(),
              );
          }

          return null;
        },
      ),
    );
  }
}

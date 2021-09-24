import 'package:app_filmes_darkweek/app/services/login/login_services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final _pageIndex = 0.obs;
  // ignore: constant_identifier_names
  static const NAVIGATOR_KEY = 1;
  // ignore: constant_identifier_names
  static const INDEX_PAGE_EXIT = 2;

  final _pages = ['/movies', '/favorites'];

  int get pageIndex => _pageIndex.value;
  final LoginService _loginService;

  HomeController({required LoginService loginService})
      : _loginService = loginService;

  void goToPage(int page) {
    _pageIndex(page);

    if (page == INDEX_PAGE_EXIT) {
      _loginService.logout();
    } else {
      Get.offNamed(_pages[page], id: NAVIGATOR_KEY);
    }

    /* aprimorando o codigo  
    if (page == 1) {
      Get.offAndToNamed('/favorites', id: NAVIGATOR_KEY);
    } else if (page == 0) {
      Get.offAndToNamed('/movies', id: NAVIGATOR_KEY);
    }*/
  }
}

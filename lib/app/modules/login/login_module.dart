import 'package:app_filmes_darkweek/app/modules/login/login_bindings.dart';
import 'package:app_filmes_darkweek/app/modules/login/login_page.dart';
import 'package:app_filmes_darkweek/app/modules/module.dart';
import 'package:get/get.dart';

class LoginModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/login',
      page: () => const LoginPage(),
      binding: LoginBindings(),
    )
  ];
}

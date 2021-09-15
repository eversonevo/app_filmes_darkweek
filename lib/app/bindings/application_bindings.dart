import 'package:app_filmes_darkweek/app/repository/login/login_repository.dart';
import 'package:app_filmes_darkweek/app/repository/login/login_repository_implements.dart';
import 'package:app_filmes_darkweek/app/services/login/login_services.dart';
import 'package:app_filmes_darkweek/app/services/login/login_services_impl.dart';
import 'package:get/get.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginRepository>(() => LoginRepositoryImplements(),
        fenix: true);
    Get.lazyPut<LoginService>(
        () => LoginServiceImpl(loginRepository: Get.find()),
        fenix: true);
  }
}

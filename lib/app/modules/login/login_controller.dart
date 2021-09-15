import 'package:app_filmes_darkweek/app/services/login/login_services.dart';
import 'package:app_filmes_darkweek/app/ui/loader/loader_mixin.dart';
import 'package:app_filmes_darkweek/app/ui/messages/messages_mixin.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with LoaderMixin, MessagesMixin {
  final LoginService _loginService;

  LoginController({required LoginService loginService})
      : _loginService = loginService;

  final loading = false.obs;
  final message = Rxn<MessageModel>();

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messageListener(message);
  }

  Future<void> login() async {
    try {
      loading.value = true; // ou loading(true);
      /*await Future.delayed(
          const Duration(seconds: 2)); // await 2.seconds.delay();*/
      await _loginService.login();
      loading.value = false;

      message(
          MessageModel.info(title: "Sucesso!", message: "Você está logado"));
    } on Exception catch (e) {
      loading.value = false;
      message(MessageModel.error(title: "Erro", message: "Erro ao logar"));
    }
  }
}

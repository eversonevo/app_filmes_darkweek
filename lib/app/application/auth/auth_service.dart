import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

// getxservice  classe q sempre fica ativa, como irá usar o usuário o tempo todo usa ela
class AuthService extends GetxService {
  User? user;

  void init() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      this.user = user;
      if (user == null) {
        Get.offNamed('/login');
      } else {
        Get.offNamed('/home');
      }
    });
  }
}

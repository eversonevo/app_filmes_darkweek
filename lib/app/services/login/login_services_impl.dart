import 'package:app_filmes_darkweek/app/repository/login/login_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './login_services.dart';

class LoginServiceImpl implements LoginService {
  final LoginRepository _loginRepository;

  LoginServiceImpl({required LoginRepository loginRepository})
      : _loginRepository = loginRepository;

  @override
  Future<UserCredential> login() => _loginRepository.login();
}

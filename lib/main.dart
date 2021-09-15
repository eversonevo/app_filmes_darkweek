import 'package:app_filmes_darkweek/app/bindings/application_bindings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/modules/login/login_module.dart';
import 'app/modules/splash/splash_module.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  RemoteConfig remoteConfig = RemoteConfig.instance;

  remoteConfig.fetchAndActivate();
  var a = remoteConfig.getString('api_filmes');

  debugPrint('aaaaaaaaaaaaaaa ' + a);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialBinding: ApplicationBindings(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        ...SplashModule().routers,
        ...LoginModule().routers,
      ],
    );
  }
}

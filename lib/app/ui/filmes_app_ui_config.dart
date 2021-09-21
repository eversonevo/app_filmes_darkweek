import 'package:flutter/material.dart';

class FilmesAppUiConfig {
  // classe que não poderá ser instanciada
  FilmesAppUiConfig._();

  static String get title => 'Filmes App';
  static ThemeData get theme => ThemeData(
        fontFamily: 'Metropolis',
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
              color: Color(0xff222222),
              fontSize: 18.0,
              fontWeight: FontWeight.w500),
        ),
      );
}

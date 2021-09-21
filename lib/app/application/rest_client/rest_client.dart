import 'package:get/get.dart';

class RestClient extends GetConnect {
  RestClient() {
    httpClient.baseUrl = 'https://api.themoviedb.org/3'; // url base da api
  }
}

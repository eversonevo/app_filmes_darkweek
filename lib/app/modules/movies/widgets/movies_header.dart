import 'package:app_filmes_darkweek/app/modules/movies/movies_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesHeader extends GetView<MoviesController> {
  const MoviesHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 196,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            width: Get.width,
            child: Image.asset(
              'assets/images/header.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: Get.width * 0.9,
            padding: const EdgeInsets.only(bottom: 20),
            child: TextField(
              onChanged: (value) => controller.filterByName(value),
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                fillColor: Colors.white,
                filled: true,
                labelText: 'Procurar filmes',
                labelStyle: const TextStyle(fontSize: 15, color: Colors.grey),
                prefixIcon: const Icon(Icons.search),
                floatingLabelBehavior:
                    FloatingLabelBehavior.never, // não deixa label subir
                contentPadding:
                    EdgeInsets.zero, // tira espaçamento interno do textfield
              ),
            ),
          ),
        ],
      ),
    );
  }
}
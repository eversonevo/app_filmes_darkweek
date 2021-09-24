import 'package:app_filmes_darkweek/app/modules/movie_detail/widgets/movie_cast.dart';
import 'package:app_filmes_darkweek/app/ui/theme_extensions.dart';
import 'package:app_filmes_darkweek/models/movie_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class MovieDetailContentMainCast extends StatelessWidget {
  MovieDetailModel? movie;

  final showPanel = false.obs;

  MovieDetailContentMainCast({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: context.themeGrey,
        ),
        Obx(() {
          return ExpansionPanelList(
            elevation: 0,
            expandedHeaderPadding: EdgeInsets.zero,
            expansionCallback: (panelIndex, isExpanded) {
              showPanel
                  .toggle(); // faz o inverso no Rx bool, se está false vira true e vice versa
            },
            children: [
              ExpansionPanel(
                  canTapOnHeader: false,
                  backgroundColor: Colors.white,
                  isExpanded: showPanel.value,
                  headerBuilder: (context, isExpanded) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Elenco',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    );
                  },
                  body: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                          movie?.cast.map((e) => MovieCast(cast: e)).toList() ??
                              []
                      /*[
                      MovieCast(cast: movie?.cast[0]),
                
                      // ERROOOO AQUIIII NÃO ESTÁ VINDO IMAGEM  ************
                      //
                    ]*/
                      ,
                    ),
                  )),
            ],
          );
        }),
      ],
    );
  }
}

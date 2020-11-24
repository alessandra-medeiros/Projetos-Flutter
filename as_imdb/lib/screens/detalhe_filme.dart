import 'package:as_imdb/components/texto_filme.dart';
import 'package:as_imdb/models/filme_info.dart';
import 'package:as_imdb/services/service_filme.dart';
import 'package:flutter/material.dart';

class DetalheFilme extends StatelessWidget {
  final String nomeFilme;
  final String imdbId;

  DetalheFilme({this.nomeFilme, this.imdbId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.nomeFilme),
      ),
      body: FutureBuilder<FilmeInfo>(
          future: getMovie(this.imdbId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          alignment: Alignment.center,
                          child: Image.network(
                            snapshot.data.poster,
                            width: 200,
                          ),
                        ),
                        Text(snapshot.data.trama, textAlign: TextAlign.justify),
                        TextoFilme("Ano : " + snapshot.data.ano),
                        TextoFilme("Gênero : " + snapshot.data.genero),
                        TextoFilme("Dirigido por : " + snapshot.data.diretor),
                        TextoFilme("Duração : " + snapshot.data.duracao),
                        TextoFilme("Avaliação : " + snapshot.data.avaliacao),
                        TextoFilme("Avaliação IMDB : " + snapshot.data.imdbAvaliacao),
                        TextoFilme("Meta Score : " + snapshot.data.metaScore),
                      ]));
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
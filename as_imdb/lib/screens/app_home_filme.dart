import 'package:as_imdb/components/lista_filme.dart';
import 'package:as_imdb/models/filme.dart';
import 'package:as_imdb/screens/detalhe_filme.dart';
import 'package:as_imdb/services/service_filme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppHome extends StatefulWidget {
  @override
  AppHomeHomeState createState() => AppHomeHomeState();
}

class AppHomeHomeState extends State<AppHome> {
  final searchTextController = new TextEditingController();
  String searchText = "";

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  void itemClick(Filme item) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DetalheFilme(
                nomeFilme: item.titulo,
                imdbId: item.imdbID,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Buscar filmes')),
        ),
        body: Column(
          children: <Widget>[
            Container(
              child: Row(children: <Widget>[
                Flexible(
                  child: TextField(
                    controller: searchTextController,
                    decoration:
                        InputDecoration(hintText: 'Insira um termo de busca'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  tooltip: 'Buscar filmes',
                  onPressed: () {
                    setState(() {
                      searchText = searchTextController.text;
                      SystemChannels.textInput.invokeMethod('TextInput.hide');
                    });
                  },
                ),
              ]),
              padding: EdgeInsets.all(10),
            ),
            if (searchText.length > 0)
              FutureBuilder<List<Filme>>(
                  future: searchMovies(searchText),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Expanded(
                          child: ListaFilme(
                              filmes: snapshot.data,
                              itemClick: this.itemClick));
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return CircularProgressIndicator();
                  }),
          ],
        ));
  }
}

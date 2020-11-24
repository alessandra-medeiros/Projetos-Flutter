import 'package:as_imdb/components/item_filme.dart';
import 'package:as_imdb/models/filme.dart';
import 'package:flutter/material.dart';

class ListaFilme extends StatelessWidget {
  final List<Filme> filmes;
  final Function itemClick;

  ListaFilme({this.filmes, this.itemClick});

  @override
  Widget build(context) {
    return new Container(
        decoration: BoxDecoration(color: Colors.grey),
        child: ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: this.filmes.length,
            itemBuilder: (BuildContext context, int index) {
              return new GestureDetector(
                  child: ItemFilme(filme: this.filmes[index]),
                  onTap: () => this.itemClick(this.filmes[index]));
            }));
  }
}

import 'package:flutter/material.dart';
import 'package:as_imdb/models/filme.dart' as models;

class ItemFilme extends StatelessWidget {
  final models.Filme filme;

  ItemFilme({this.filme});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(children: <Widget>[
            if (this.filme.poster != "N/A")
              Image.network(this.filme.poster, height: 100, width: 100)
          ]),
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    this.filme.titulo,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Text(this.filme.ano),
                  Text(this.filme.tipo)
                ]),
          )
        ],
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 8, left: 10, right: 10),
      decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.white),
    );
  }
}
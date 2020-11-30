import 'package:flutter/material.dart';
import 'package:harry_potter/model/character.dart';
import 'package:harry_potter/util/functions.dart';

class CharacterDetails extends StatefulWidget {
  final Character character;

  CharacterDetails(this.character);
  @override
  _CharacterDetailsState createState() => _CharacterDetailsState();
}

class _CharacterDetailsState extends State<CharacterDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.character.name),
        backgroundColor: Colors.brown,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Image.network(widget.character.image),
              height: 300,
              margin: EdgeInsets.only(top: 30),
            ),
            widget.character.house == ""
                ? Container()
                : Container(
                    margin: const EdgeInsets.only(left: 8, right: 8, top: 30),
                    child: Card(
                      child: Container(
                        height: 40,
                        margin: const EdgeInsets.only(
                            left: 8, right: 8, top: 8, bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Casa: ",
                              style: infoStyle(),
                            ),
                            Text(
                              widget.character.house,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: houseColor(widget.character.house)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
            Container(
              margin: const EdgeInsets.only(left: 8, right: 8),
              child: Card(
                child: Container(
                  height: 40,
                  margin: const EdgeInsets.only(
                      left: 8, right: 8, top: 8, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Estudante de Hogwarts: ",
                        style: infoStyle(),
                      ),
                      Text(
                        widget.character.isStudent.toString(),
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(left: 8, right: 8),
                child: Card(
                    child: Container(
                      height: 40,
                  margin: const EdgeInsets.only(
                      left: 8, right: 8, top: 8, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          "Estrelado por: " + widget.character.actor,
                          style: infoStyle(),
                        ),
                      ),
                    ],
                  ),
                ))),
          ],
        ),
      ),
    );
  }

  TextStyle infoStyle() {
    return TextStyle(fontSize: 20);
  }
}

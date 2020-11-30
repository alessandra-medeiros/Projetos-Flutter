import 'package:flutter/material.dart';
import 'package:harry_potter/model/character.dart';
import 'package:harry_potter/util/functions.dart';
import 'package:harry_potter/view/character_details.dart';
import "../service/character_service.dart";
import "../service/student_service.dart";

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CharacterService characterService = CharacterService();
  StudentService studentService = StudentService();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: Text("Harry Potter Personagens"),
          bottom: TabBar(
            tabs: [
              Tab(text: "Todos"),
              Tab(text: "Alunos de Hogwarts"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: FutureBuilder<List<Character>>(
                future: characterService.fetchCharacters(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                  return Column(
                    children: snapshot.data
                      .map((item) => Container(
                        margin: const EdgeInsets.only(left: 8, right: 8, top: 8),
                        child: GestureDetector(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                              child: ListTile(
                                title: Text(item.name),
                                leading: Container(
                                  height: 60,
                                  width: 60,
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(item.image),
                                  ),
                                ),
                                trailing: Text(
                                  item.house,
                                  style: TextStyle(
                                    color: houseColor(item.house)
                                  ),
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CharacterDetails(item))
                            );
                          },
                        ),
                      ))
                      .toList());
                  } else
                    return Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Center(child: CircularProgressIndicator())
                    );
                },
              )
            ),

            SingleChildScrollView(
              child: FutureBuilder<List<Character>>(
                future: studentService.fetchStudents(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                  return Column(
                    children: snapshot.data
                      .map((item) => Container(
                        margin: const EdgeInsets.only(left: 8, right: 8, top: 8),
                        child: GestureDetector(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                              child: ListTile(
                                title: Text(item.name),
                                leading: Container(
                                  height: 60,
                                  width: 60,
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(item.image),
                                  ),
                                ),
                                trailing: Text(
                                  item.house,
                                  style: TextStyle(
                                    color: houseColor(item.house)
                                  ),
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CharacterDetails(item))
                            );
                          },
                        ),
                      ))
                      .toList());
                  } else
                    return Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Center(child: CircularProgressIndicator())
                    );
                },
              )
            ),
          ],

        ),
      ),
    );
    
  }
}

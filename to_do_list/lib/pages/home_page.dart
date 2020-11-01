import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do_list/models/const.dart';
import 'package:to_do_list/utils/db_helpder.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController newTaskCtrl = TextEditingController();
  DatabaseHelper _dbhelper = DatabaseHelper();
  List<Todo> item = List<Todo>();
  bool done = false;

  @override
  void initState() {
    super.initState();
    updateListView();
  }

  void delete(Todo item) async {
    await _dbhelper.deleteTodo(item.id);
  }

  void save(Todo item) async {
    if (item.id != null) {
      await _dbhelper.updateTodo(item);
      print('update');
    } else {
      await _dbhelper.insertTodo(item);
      print('insert');
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = _dbhelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Todo>> todoListFuture = _dbhelper.getTodoList();
      todoListFuture.then((item) {
        setState(() {
          this.item = item;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'To-do List',
        ),
      ),
      body: ListView.builder(
        itemCount: item.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return Dismissible(
            direction: DismissDirection.startToEnd,
            child: CheckboxListTile(
              title: Text(item[index].title ?? ""),
              onChanged: (bool value) {
                setState(() {
                  item[index].done = value == true ? 1 : 0;
                  save(item[index]);
                });
              },
              value: done = item[index].done == 1 ? true : false,
            ),
            key: Key(item[index].title),
            onDismissed: (direction) {
              delete(item[index]);
              updateListView();
            },
            background: Container(
              color: Colors.red,
              child: Align(
                alignment: Alignment(-0.9, 0),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Alert(
              context: context,
              title: "Nova tarefa",
              content: Column(
                children: <Widget>[
                  TextField(
                    controller: newTaskCtrl,
                    decoration: InputDecoration(
                      labelText: 'Nome',
                    ),
                  ),
                ],
              ),
              buttons: [
                DialogButton(
                  onPressed: () {
                    save(Todo(newTaskCtrl.text, 0));
                    newTaskCtrl.text = '';
                    updateListView();
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Salvar tarefa",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )
              ]).show();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,
      ),
    );
  }
}
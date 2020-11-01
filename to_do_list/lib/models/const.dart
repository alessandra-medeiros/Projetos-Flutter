class Todo {
  int _id;
  String _title;
  int _done;

  Todo(this._title, this._done);
  Todo.comId(this._id, this._title, this._done);

  int get id => _id;

  String get title => _title;

  int get done => _done;

  set title(String newTitle) {
    if (newTitle.length <= 255) {
      this._title = newTitle;
    }
  }

  set done(int newDone) {
    this._done = newDone;
  }

  Map<String, dynamic> toMap() {
    //convete um obj para um mapa
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;
    map['done'] = _done;
    return map;
  }

  Todo.fromMapObject(Map<String, dynamic> map) {
    //Pega um mapa e convente para um obj.
    this._id = map['id'];
    this._title = map['title'];
    this._done = map['done'];
  }
}

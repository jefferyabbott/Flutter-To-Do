import 'package:hive/hive.dart';

class ToDoDatabase {
  List toDoList = [];

  // reference the box
  final _box = Hive.box('todoBox');

  // first time opening the app
  void createInitialData() {
    toDoList = [
      ["Add a to do item!", false],
    ];
    updateDatabase();
  }

  // load from the database
  void loadData() {
    toDoList = _box.get("TODOLIST");
  }

  // uopdate the database
  void updateDatabase() {
    _box.put("TODOLIST", toDoList);
  }
}

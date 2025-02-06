import '../Entity/ToDoList.dart';

abstract class ToDoListRepositoy {

  void save(Todolist toDoList);

  bool remove(int number);

  List<Todolist> findAll();

}

class ToDoListRepositoryIMPL implements ToDoListRepositoy{

  final List<Todolist> _todolist = [];

  @override
  void save(Todolist toDoList) {
    // TODO: implement save
    _todolist.add(toDoList);
  }

  @override
  bool remove(int number) {
    // TODO: implement remove
    if (number > _todolist.length) {
      return false;
    }

    _todolist.removeAt(number - 1);
    return true;
  }

  @override
  List<Todolist> findAll() {
    // TODO: implement findAll
    return this._todolist;
  }
  
}
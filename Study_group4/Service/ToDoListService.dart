import '../Entity/ToDoList.dart';
import '../Repository/ToDoListRepository.dart';

abstract class ToDoListService {

  void showToDoList();

  void addToDoList(String todo);

  void removeToDoList(int number);

}

class ToDoListServiceIMPL implements ToDoListService {

  final ToDoListRepositoy _toDoListRepositoy;

  ToDoListServiceIMPL(this._toDoListRepositoy);

  @override
  void showToDoList() {
    // TODO: implement showToDoList
    if (_toDoListRepositoy.findAll().isNotEmpty) {
      print("TODOLIST");
      _toDoListRepositoy.findAll().asMap().forEach((index, value) {
        print("${index + 1}. $value");
      });
        print("");
    }
  }

  @override
  void addToDoList(String todo) {
    // TODO: implement addToDoList
    var todolist = Todolist(task: todo);
    _toDoListRepositoy.save(todolist);
    print("");
    print("SUCCESS MENAMBAH TODOLIST");
  }

  @override
  void removeToDoList(int number) {
    // TODO: implement removeToDoList
    if(_toDoListRepositoy.remove(number)){
      print("");
      print("SUKSES MENGHAPUS TODOLIST");
    } else {
      print(""); 
      print("GAGAL MENGHAPUS TODOLIST");
    }
  }

}
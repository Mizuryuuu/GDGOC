import '../Entity/ToDoList.dart';
import '../Repository/ToDoListRepository.dart';
import '../Service/ToDoListService.dart';

void testShowToDoList(){

  var todolistRepository = ToDoListRepositoryIMPL();
  todolistRepository.save(Todolist(task: "Belajar Dart"));
  todolistRepository.save(Todolist(task: "Belajar OOP Dart"));
  todolistRepository.save(Todolist(task: "Belajar Control Flow Dart"));
  var todolistService = ToDoListServiceIMPL(todolistRepository);
  todolistService.showToDoList();

}

void testAddToDoList(){

  var todolistRepository = ToDoListRepositoryIMPL();

  var todolistService = ToDoListServiceIMPL(todolistRepository);
  todolistService.addToDoList("Belajar Dart");
  todolistService.addToDoList("Belajar OOP Dart");
  todolistService.addToDoList("Belajar Control Flow");

  todolistService.showToDoList();

}

void testRemoveToDoList(){

  var todolistRepository = ToDoListRepositoryIMPL();

  var todolistService = ToDoListServiceIMPL(todolistRepository);
  todolistService.addToDoList("Belajar Dart");
  todolistService.addToDoList("Belajar OOP Dart");
  todolistService.addToDoList("Belajar Control Flow");
  todolistService.showToDoList();

  todolistService.removeToDoList(2);
  todolistService.showToDoList();

  todolistService.removeToDoList(3);
  todolistService.showToDoList();

  todolistService.removeToDoList(1);
  todolistService.showToDoList();

  todolistService.removeToDoList(2);
  todolistService.showToDoList();
  
}

// void main(){
//   // testShowToDoList();
//   // testAddToDoList();
//   // testRemoveToDoList();
// }
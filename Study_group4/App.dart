import 'Repository/ToDoListRepository.dart';
import 'Service/ToDoListService.dart';
import 'View/ToDoListView.dart';

void main(){

  print("Aplikasi ToDoList");

  var todolistRepository = ToDoListRepositoryIMPL();
  var todolistService = ToDoListServiceIMPL(todolistRepository);
  var todolistView = ToDoListView(todolistService);

  todolistView.showToDoList();

}
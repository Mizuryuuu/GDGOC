import '../Repository/ToDoListRepository.dart';
import '../Service/ToDoListService.dart';
import '../View/ToDoListView.dart';

void testViewShowToDoList()
{
  var todolistRepository = ToDoListRepositoryIMPL();
  var todolistService = ToDoListServiceIMPL(todolistRepository);
  var todolistView = ToDoListView(todolistService);

  todolistService.addToDoList("Belajar PHP");
  todolistService.addToDoList("Belajar PHP OOP");
  todolistService.addToDoList("Belajar PHP Database");

  todolistView.showToDoList();

}

void testViewAddToDoList()
{
  var todolistRepository = ToDoListRepositoryIMPL();
  var todolistService = ToDoListServiceIMPL(todolistRepository);
  var todolistView = ToDoListView(todolistService);

  todolistService.addToDoList("Belajar PHP");
  todolistService.addToDoList("Belajar PHP OOP");
  todolistService.addToDoList("Belajar PHP Database");

  todolistService.showToDoList();

  todolistView.addToDoList();

  todolistService.showToDoList();

  todolistView.addToDoList();

  todolistService.showToDoList();
}

void testViewRemoveToDoList()
{
  var todolistRepository = ToDoListRepositoryIMPL();
  var todolistService = ToDoListServiceIMPL(todolistRepository);
  var todolistView = ToDoListView(todolistService);

  todolistService.addToDoList("Belajar PHP");
  todolistService.addToDoList("Belajar PHP OOP");
  todolistService.addToDoList("Belajar PHP Database");

  todolistService.showToDoList();

  todolistView.removeToDoList();

  todolistService.showToDoList();

  todolistView.removeToDoList();

  todolistService.showToDoList();
}

void main() {
  // testViewShowToDoList();
  // testViewAddToDoList();
  testViewRemoveToDoList();
}
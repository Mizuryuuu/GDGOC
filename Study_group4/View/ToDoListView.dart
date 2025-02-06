import '../Helper/InputHelper.dart';
import '../Service/ToDoListService.dart';

class ToDoListView {

  ToDoListService _toDoListService;

  ToDoListView(this._toDoListService);

  void showToDoList() {
    while(true){
      this._toDoListService.showToDoList();
      print("MENU");
      print("1. Tambah Todo");
      print("2. Hapus Todo");
      print("x. Keluar");

      String pilihan = Inputhelper.input("Pilih");

      if(pilihan == "1"){
        this.addToDoList();
      } else if (pilihan == "2"){
        this.removeToDoList();
      } else if (pilihan == "x"){
        break;
      } else {
        print("Pilihan tidak di mengerti");
      }
      
    }

    print("Sampai Jumpa Lagi");
  }

  void addToDoList(){
    print("MENAMBAH TODO");

    String task = Inputhelper.input("Task (x untuk batal)");

    if(task == "x"){
      print("Batal untuk menambah todo");
      print("");
    } else {
      this._toDoListService.addToDoList(task);
      print("");
    }
  }

  void removeToDoList(){
    print("MENGHAPUS TODO");

    String pilihan = Inputhelper.input("Nomor (x untuk batal)");

    if (pilihan == "x") {
      print("Batal untuk menghapus todo");
      print("");
    } else {
      this._toDoListService.removeToDoList(int.parse(pilihan));
      print("");
    }
  }

}
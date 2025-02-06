import 'dart:io';

class Inputhelper{

  static input(String info) {
    stdout.write("$info : ");
    var result = stdin.readLineSync();
    return result?.trim();
  }

}
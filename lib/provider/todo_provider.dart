import 'package:flutter/material.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/service/todo_service.dart';

class ToDoProvider with ChangeNotifier {
  final List<ToDo> todoList = ToDo.toDos;
  List<ToDo> foundtodoList = [];

  ToDoProvider() {
    foundtodoList = todoList;
  }

  void toggleIsDone(ToDo todo) {
    ToDoService.toggleIsDone(todo);
    notifyListeners();
  }

  void addToDo(String title) {
    ToDoService.addToDo(todoList, title);
    foundtodoList = todoList;
    notifyListeners();
  }

  void deleteToDo(String id) {
    ToDoService.deleteToDo(todoList, id);
    foundtodoList = todoList;
    notifyListeners();
  }

  void search(String query) {
    foundtodoList = ToDoService.search(todoList, query);
    notifyListeners();
  }
}

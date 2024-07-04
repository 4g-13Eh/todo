import 'package:flutter/material.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/service/todo_service.dart';
import 'package:uuid/uuid.dart';

class ToDoProvider with ChangeNotifier {
  List<ToDo> _todoList = [];
  //List<ToDo> foundtodoList = [];

  List<ToDo> get todoList => _todoList;

  ToDoProvider() {
    loadTodos();
  }

  void loadTodos() async {
    _todoList = await ToDoService.readToDoList();
    notifyListeners();
  }

  void saveTodos() async {
    await ToDoService.writeToDoList(_todoList);
  }

  void toggleIsDone(ToDo todo) {
    todo.isDone = !todo.isDone;
    saveTodos();
    notifyListeners();
  }

  void addToDo(String title) {
    _todoList.add(ToDo(id: Uuid().v4(), title: title, isDone: false));
    saveTodos();
    notifyListeners();
  }

  void deleteToDo(String id) {
    _todoList.removeWhere((item) => item.id == id);
    saveTodos();
    notifyListeners();
  }

  void search(String query) {
    _todoList = ToDoService.search(todoList, query);
    notifyListeners();
  }

    void deleteAllToDos() {
      _todoList.clear();
      saveTodos();
    notifyListeners();
  }
}

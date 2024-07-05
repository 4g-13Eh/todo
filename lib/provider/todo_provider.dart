import 'package:flutter/material.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/service/todo_service.dart';
import 'package:uuid/uuid.dart';

class ToDoProvider with ChangeNotifier {
  List<ToDo> _todoList = [];
  List<ToDo> filteredTodoList = [];

  List<ToDo> get todoList => filteredTodoList.isEmpty ? _todoList : filteredTodoList;

  ToDoProvider() {
    loadTodos();
  }

  void loadTodos() async {
    _todoList = await ToDoService.readToDoList();
    filteredTodoList = _todoList;
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
    filteredTodoList = _todoList;
    saveTodos();
    notifyListeners();
  }

  void deleteToDo(String id) {
    _todoList.removeWhere((item) => item.id == id);
    filteredTodoList = _todoList;
    saveTodos();
    notifyListeners();
  }

  void search(String query) {
    if (query.isEmpty) {
      filteredTodoList = _todoList;
    } else {
      filteredTodoList = _todoList.where((todo) => todo.title!.toUpperCase().contains(query.toUpperCase())).toList();
    }
    notifyListeners();
  }

    void deleteAllToDos() {
      _todoList.clear();
      filteredTodoList = _todoList;
      saveTodos();
    notifyListeners();
  }
}

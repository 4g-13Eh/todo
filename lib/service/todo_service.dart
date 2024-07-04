import 'package:todo/model/todo.dart';
import 'package:uuid/uuid.dart';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';


class ToDoService {
  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/todo.json');
  }

  static Future<List<ToDo>> readToDoList() async {
    try {
      final file = await _localFile;
      if(!await file.exists()) {
        return [];
      }
      final contents = await file.readAsString();
      final List<dynamic> json = jsonDecode(contents) as List;
      return json.map((json) => ToDo.fromJson(json)).toList();
    } catch (e) {
      return [];
    }
  }

  static Future<File> writeToDoList(List<ToDo> todoList) async {
    final file = await _localFile;
    final jsonList = todoList.map((todo) => todo.toJson()).toList();
    return file.writeAsString(jsonEncode(jsonList));
  }

  static void toggleIsDone(ToDo todo) {
    todo.isDone = !todo.isDone;
  }

  static void addToDo(List<ToDo> todoList, String title) {
    todoList.add(ToDo(
      id: Uuid().v4(),
      title: title,
      isDone: false,
    ));
  }

  static void deleteToDo(List<ToDo> todoList, String id) {
    todoList.removeWhere((item) => item.id == id);
  }

  static List<ToDo> search(List<ToDo> todoList, String query) {
    if (query.isEmpty) {
      return todoList;
    } else {
      return todoList.where((todo) => todo.title!.toUpperCase().contains(query.toUpperCase())).toList();
    }
  }

  static void deleteAllToDos(List<ToDo> todoList) {
    todoList.clear();
  }
}

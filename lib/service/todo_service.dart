import 'package:todo/model/todo.dart';
import 'package:uuid/uuid.dart';

class ToDoService {
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
}

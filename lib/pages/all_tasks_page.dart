import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:todo/widgets/todo_item.dart';
import 'package:todo/model/todo.dart';

class AllTasksPage extends StatelessWidget {
  const AllTasksPage({Key? key}) : super(key: key);

  final todoList = ToDo.toDos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ToDo App'), backgroundColor: Color.fromARGB(255, 188, 245, 56)),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            searchField(),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    child: Text('Alle Aufgaben', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                  ),
                  ToDoItem(),
                  for( ToDo todo in todoList)
                    ToDoItem(todo: todo,)
                ],
              )
            )
            
            
          ],
        ),
        
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
    );
  }
}

Widget searchField(){
  return Container(
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
    child: TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10),
        prefixIcon: Icon(Icons.search, size: 25, color: Colors.black,),
        prefixIconConstraints: BoxConstraints(maxHeight: 20, minHeight: 20),
        hintText: 'Suchen',
      ),
    ),
  );
}
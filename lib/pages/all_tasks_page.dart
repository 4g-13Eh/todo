import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:todo/widgets/todo_item.dart';
import 'package:todo/model/todo.dart';
import 'package:uuid/uuid.dart';

class AllTasksPage extends StatefulWidget {
  AllTasksPage({Key? key}) : super(key: key);

  @override
  State<AllTasksPage> createState() => _AllTasksPageState();
}

class _AllTasksPageState extends State<AllTasksPage> {
  final todoList = ToDo.toDos;
  final todoEditor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ToDo App'), backgroundColor: Color.fromARGB(255, 188, 245, 56)),
      body: Stack(
        children: [
          Container(
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
                      for( ToDo todo in todoList)
                        ToDoItem(
                          todo: todo, 
                          onIsDoneChanged: handleIsDoneChange,
                          onDelete: deleteToDo,
                        )
                    ],
                  )
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(child: Container(
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [BoxShadow(color: Color.fromARGB(255, 46, 131, 216), blurRadius: 5)]
                ),
                child: TextField(
                  controller: todoEditor,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: 'Neue Aufgabe',
                  ),
                ),
              ),),
              Container(
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 46, 131, 216),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [BoxShadow(color: Color.fromARGB(255, 46, 131, 216), blurRadius: 5)]
                ),
                child: IconButton(
                  icon: const Icon(Icons.add, color: Colors.white,),
                  onPressed: (){addToDo(todoEditor.text);},
                ),)
            ],),
            )
        ],
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
    );
  }

  void handleIsDoneChange(ToDo todo){
    setState((){todo.isDone = !todo.isDone;});
  }

  void addToDo(todo){
    setState(() {
      todoList.add(ToDo(
        id: Uuid().v4(),
        title: todoEditor.text,
        isDone: false
      ));
      todoEditor.clear();
    });
  }

  void deleteToDo(String id){
    setState(() {
      todoList.removeWhere((item) => item.id == id);
    });
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
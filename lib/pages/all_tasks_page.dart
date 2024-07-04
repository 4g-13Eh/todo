import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/widgets/todo_item.dart';
import 'package:todo/provider/todo_provider.dart';
import 'package:todo/model/todo.dart';

class AllTasksPage extends StatefulWidget {
  AllTasksPage({Key? key}) : super(key: key);

  @override
  State<AllTasksPage> createState() => _AllTasksPageState();
}

class _AllTasksPageState extends State<AllTasksPage> {
  final todoEditor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<ToDoProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('TaskHub'), backgroundColor: Color.fromARGB(255, 223, 123, 10), centerTitle: true, ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                searchField(todoProvider),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20, bottom: 20),
                        child: Text('Alle Aufgaben', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                      ),
                      for( ToDo todo in todoProvider.foundtodoList.reversed)
                        ToDoItem(
                          todo: todo, 
                          onIsDoneChanged: todoProvider.toggleIsDone,
                          onDelete: todoProvider.deleteToDo,
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
                  onPressed: (){ 
                    todoProvider.addToDo(todoEditor.text);
                    todoEditor.clear();
                  },
                ),)
            ],),
            )
        ],
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
    );
  }

  Widget searchField(ToDoProvider todoProvider){
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: TextField(
        onChanged: (queryString) => todoProvider.search(queryString),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          prefixIcon: Icon(Icons.search, size: 25, color: Colors.black,),
          prefixIconConstraints: BoxConstraints(maxHeight: 20, minHeight: 20),
          hintText: 'Suchen',
        ),
      ),
    );
  }
}

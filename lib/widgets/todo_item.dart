import 'package:flutter/material.dart';
import 'package:todo/model/todo.dart';

class ToDoItem extends StatelessWidget{
  final ToDo todo;
  final onIsDoneChanged;
  final onDelete;

  const ToDoItem({Key? key, required this.todo, required this.onIsDoneChanged, this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: ListTile(
        onTap: (){onIsDoneChanged(todo);},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        tileColor: Color.fromARGB(193, 207, 206, 206),
        leading: Icon(todo.isDone? Icons.check_box : Icons.check_box_outline_blank, color: Color.fromARGB(255, 127, 32, 216), size: 30),
        title: Text(todo.title!, style: TextStyle(fontSize:18, decoration: todo.isDone? TextDecoration.lineThrough : null),),
        trailing: Container(
          child: IconButton(icon: Icon(Icons.delete), onPressed: (){print('tapped delete');}, color: Colors.red, iconSize: 30,)
        ),
      ),
    );
  }
}
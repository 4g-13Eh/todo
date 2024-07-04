import 'package:flutter/material.dart';

class ToDoItem extends StatelessWidget{
  const ToDoItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: ListTile(
        onTap: (){print('Tapped');},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        tileColor: Color.fromARGB(193, 207, 206, 206),
        leading: Icon(Icons.check_box, color: Color.fromARGB(255, 127, 32, 216), size: 30),
        title: Text('Einkaufen', style: TextStyle(fontSize:18, decoration: TextDecoration.lineThrough),),
        trailing: Container(
          child: IconButton(icon: Icon(Icons.delete), onPressed: (){print('tapped delete');}, color: Colors.red, iconSize: 30,)
        ),
      ),
    );
  }
}
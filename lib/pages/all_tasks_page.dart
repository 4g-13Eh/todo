import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AllTasksPage extends StatelessWidget {
  const AllTasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ToDo App'), backgroundColor: Color.fromARGB(255, 188, 245, 56)),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            searchField(),
            
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
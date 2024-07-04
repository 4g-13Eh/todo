import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AllTasksPage extends StatelessWidget {
  const AllTasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ToDo App'), backgroundColor: Color.fromARGB(255, 188, 245, 56)),
      body: Container(
        child: Text('All Tasks Page'),
        
      ), 
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
    );
  }
}
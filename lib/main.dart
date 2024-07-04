import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/pages/all_tasks_page.dart';
import 'package:todo/provider/todo_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ToDoProvider(),
      child: MaterialApp(
        home: AllTasksPage(),
      ),
    );
  }
}

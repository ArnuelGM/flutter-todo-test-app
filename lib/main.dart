import 'package:flutter/material.dart';
import 'package:prueba/tabs/tab_add.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Todo App'),
            bottom: const TabBar(tabs: [
              Tab(icon: Icon(Icons.add)),
              Tab(icon: Icon(Icons.timelapse)),
              Tab(icon: Icon(Icons.task_alt))
            ]),
          ),
          body: const TabBarView(
            children: [
              TabAdd(),
              Icon(Icons.timelapse),
              Icon(Icons.task_alt),
            ]
          ),
        ),
      ),
    );
  }
}

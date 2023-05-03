import 'package:flutter/material.dart';
import 'package:prueba/Model/todo.dart';

class TodoDetailPage extends StatefulWidget {

  final Todo todo;
  const TodoDetailPage({ Key? key, required this.todo});

  @override
  State<TodoDetailPage> createState() => _TodoDetailPageState();
}

class _TodoDetailPageState extends State<TodoDetailPage> {

  TextEditingController detailController = TextEditingController();
  TextEditingController titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    
    detailController.text = widget.todo.detail;
    titleController.text = widget.todo.title;

    detailController.addListener(() => setState(() {
      widget.todo.detail = detailController.text;
    }));

    titleController.addListener(() => setState(() {
      widget.todo.title = titleController.text;
      setState(() { });
    }));
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
        backgroundColor: Colors.green[700],
        actions: [
          TextButton(
            onPressed: () => changeStatus(context), 
            child: Text(widget.todo.done ? 'PENDING' : 'DONE', 
              style: const TextStyle(color: Colors.white)
            )
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              maxLines: 4,
              minLines: 1,
              decoration: const InputDecoration(border: InputBorder.none),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black, 
                fontSize: 30
              )
            ),
            Container(height: 20),
            TextField(
              controller: detailController,
              maxLines: 6,
              minLines: 3,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Description'),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            )
          ],
        ),
      ),
    );
  }

  changeStatus(context) {
    widget.todo.done = !widget.todo.done;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(widget.todo.done ? 'Taks marked as done!' : 'Taks marked as pending!'),
    ));
    setState(() {});
  }

  editTitle(context) {

  }
}
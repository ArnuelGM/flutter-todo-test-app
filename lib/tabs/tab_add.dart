import 'package:flutter/material.dart';
import 'package:prueba/Model/todo.dart';
import 'package:prueba/pages/detail_page.dart';

class TabAdd extends StatefulWidget {

  const TabAdd({Key? key}) : super(key: key);

  @override
  _TabAddPageState createState() => _TabAddPageState();
}

class _TabAddPageState extends State<TabAdd> {

  final List<Todo> list = [Todo(title: 'First Todo')];
  TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list.isEmpty
          ? (Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/new_task.png', width: 280),
                    Container(
                      height: 20,
                    ),
                    const Text('Write someting TODO',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black38,
                        ))
                  ]),
            ))
          : ListView.separated(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Checkbox(value: list[index].done, onChanged: null),
                  title: Text(list[index].title, 
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 18, 
                      decoration: list[index].done ? TextDecoration.lineThrough : null,
                      color: list[index].done ? Colors.black45 : Colors.black,
                      overflow: TextOverflow.ellipsis
                    ),
                  ),
                  subtitle: list[index].detail.isNotEmpty ? Text(list[index].detail, maxLines: 1, overflow: TextOverflow.ellipsis,) : null,
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => TodoDetailPage(todo: list[index])));
                  },
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(color: Colors.black26);
              }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => openAlert(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> openAlert(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (_) => AlertDialog(
              title: const Text('Title'),
              content: TextField(autofocus: true, controller: inputController),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel')),
                TextButton(
                    onPressed: () => addItem(context), child: const Text('OK')),
              ],
            ));
  }

  addItem(context) {
    list.add(Todo(title: inputController.text));
    inputController.text = '';
    Navigator.pop(context, 'OK');
    setState(() {});
  }
}



import 'package:flutter/material.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Todo App",
      home: TodoHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TodoHome extends StatefulWidget {
  const TodoHome({super.key});

  @override
  State<TodoHome> createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  late String value;
  var todoList = [''];
  addtodoApp(String item) {
    setState(() {
      todoList.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addtodoApp(value);
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder( 
        padding: EdgeInsets.all(16),
          itemCount: todoList.length,
          itemBuilder: (context, int index) {
            return index == 0
                ? 

              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Add Item'
                ),
                    onChanged: (val) {
                      value = val;
                    },
                  )
                : ListTile(
                    title: Text('${todoList[index]}'),
                    leading: const Icon(Icons.work),
                  );
          }),
    );
  }
}

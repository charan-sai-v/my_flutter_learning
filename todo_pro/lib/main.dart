import 'package:flutter/material.dart';

void main() {
  runApp(const TaskManagerApp());
}


class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDoPro',
      theme: ThemeData(
        primaryColor: Colors.amberAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const TaskListScreen(),
    );
  }
}


class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final TextEditingController _textController = TextEditingController();
  List<String> tasks = [
    "Task 1",
    "Task 2",
    "Task 3",
  ];

  void _addTask(String task){
    setState(() {
      tasks.add(task);
    });
  }

  void _removeTask(int index){
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Tasks'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(tasks[index]),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => _removeTask(index),
            ),
          );
        },
      ),
      floatingActionButton: IconButton(

        color: Colors.blue,
        icon: const Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Add Task'),
                  content: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                        labelText: 'Enter the task'
                    ),
                  ),
                  actions: [
                    TextButton(
                      child: const Text('Cancel'),
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: const Text('Add'),
                      onPressed: (){
                        _addTask(_textController.text);
                        _textController.clear();
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              }
          );
        },
      ),

    );
  }
}


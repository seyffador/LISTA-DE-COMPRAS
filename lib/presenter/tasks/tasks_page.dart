import 'package:flutter/material.dart';
import 'package:projetofluttercontador/domain/entities/task.dart';
import 'package:projetofluttercontador/presenter/add_task/add_task_page.dart';
import 'package:projetofluttercontador/presenter/task_details/task_details_page.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task List'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasks[index].title),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: tasks[index].isCompleted,
                  onChanged: (value) {
                    setState(
                      () {
                        tasks[index].isCompleted = value!;
                      },
                    );
                  },
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      tasks.removeAt(index);
                    });
                  },
                  child: const Icon(Icons.delete),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TaskDetailsPage(task: tasks[index]),
                ),
              ).then((value) {
                setState(() {});
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTaskPage(),
            ),
          ).then((newTask) {
            if (newTask != null) {
              setState(() {
                tasks.add(newTask);
              });
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

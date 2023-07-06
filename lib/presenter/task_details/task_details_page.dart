import 'package:flutter/material.dart';
import 'package:projetofluttercontador/domain/entities/task.dart';

import 'package:projetofluttercontador/presenter/edit_task/edit_tasks_page.dart';

class TaskDetailsPage extends StatefulWidget {
  final Task task;

  const TaskDetailsPage({required this.task, Key? key}) : super(key: key);

  @override
  State<TaskDetailsPage> createState() => _TaskDetailsPageState();
}

class _TaskDetailsPageState extends State<TaskDetailsPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.task.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.task.isCompleted ? 'Completed' : 'Pending',
              style: TextStyle(
                fontSize: 16,
                color: widget.task.isCompleted ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditTaskPage(task: widget.task),
            ),
          ).then((editedTask) {
            if (editedTask != null) {
              widget.task.title = editedTask.title;
              widget.task.isCompleted = editedTask.isCompleted;
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Task updated successfully')),
              );
            }
          });
        },
        child: const Icon(Icons.edit),
      ),
    );

  }
}

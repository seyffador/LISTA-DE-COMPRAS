import 'package:flutter/material.dart';

class Task {
  String title;
  bool isCompleted;

  Task({required this.title, this.isCompleted = false});
}

void main() {
  runApp(TaskApp());
}

class TaskApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TaskListScreen(),
    );
  }
}

class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Task List'),
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
                    onTap: (){
                      setState(() {
                        tasks.removeAt(index);
                      });
                    },
                    child:  Icon(Icons.delete),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TaskDetailsScreen(task: tasks[index]),
                  ),
                ).then((value)  {
                  setState(() {

                  });
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
                builder: (context) => AddTaskScreen(),
              ),
            ).then((newTask) {
              if (newTask != null) {
                setState(() {
                  tasks.add(newTask);
                });
              }
            });
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class TaskDetailsScreen extends StatelessWidget {
  final Task task;

  TaskDetailsScreen({required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              task.isCompleted ? 'Completed' : 'Pending',
              style: TextStyle(
                fontSize: 16,
                color: task.isCompleted ? Colors.green : Colors.red,
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
              builder: (context) => EditTaskScreen(task: task),
            ),
          ).then((editedTask) {
            if (editedTask != null) {
              task.title = editedTask.title;
              task.isCompleted = editedTask.isCompleted;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Task updated successfully')),
              );
            }
          });
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Task Title',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String title = _titleController.text.trim();
                if (title.isNotEmpty) {
                  Navigator.pop(
                    context,
                    Task(title: title),
                  );
                }
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}

class EditTaskScreen extends StatefulWidget {
  final Task task;

  EditTaskScreen({required this.task});

  @override
  _EditTaskScreenState createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  late TextEditingController _titleController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task.title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Task'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Task Title',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String title = _titleController.text.trim();
                if (title.isNotEmpty) {
                  Navigator.pop(
                    context,
                    Task(
                      title: title,
                      isCompleted: widget.task.isCompleted,
                    ),
                  );
                }
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:projetofluttercontador/domain/entities/task.dart';

abstract class TaskRepository {
  void create(Task task);

  void update(Task task);

  List<Task> findAll();

  void delete(String id);
}

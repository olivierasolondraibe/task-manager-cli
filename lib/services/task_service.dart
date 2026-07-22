import '../exceptions/task_exception.dart';
import '../models/urgent_task.dart';
import '../repositories/task_repository.dart';

class TaskService {
  final TaskRepository repository;

  TaskService(this.repository);

  Future<List<UrgentTask>> getTasks() async {
    return repository.getAll();
  }

  Future<List<UrgentTask>> getTask() async {
    return repository.getAll();
  }

  Future<void> addTask(UrgentTask task) async {
    final tasks = await repository.getAll();
    tasks.add(task);
    await repository.save(tasks);
  }

  Future<void> completeTask(int index) async {
    final tasks = await repository.getAll();

    if (index < 0 || index >= tasks.length) {
      throw TaskException('Task not found');
    }

    tasks[index].markCompleted();
    await repository.save(tasks);
  }

  Future<void> completed(int index) async {
    await completeTask(index);
  }

  Future<void> deleteTask(int index) async {
    final tasks = await repository.getAll();

    if (index < 0 || index >= tasks.length) {
      throw TaskException('Task not found');
    }

    tasks.removeAt(index);
    await repository.save(tasks);
  }
}

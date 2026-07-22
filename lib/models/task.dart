import '../enums/priority.dart';
import '../interfaces/serializable.dart';

abstract class Task implements JsonSerializable {
  String title;
  Priority priority;
  DateTime? dueDate;
  bool completed;

  Task({
    required this.title,
    required this.priority,
    this.dueDate,
    this.completed = false,
  });

  void markCompleted() {
    completed = true;
  }
}

import 'task.dart';
import '../enums/priority.dart';

class UrgentTask extends Task {
  UrgentTask({
    required String title,
    DateTime? dueDate,
  }) : super(
          title: title,
          priority: Priority.high,
          dueDate: dueDate,
        );

  @override
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'priority': priority.name,
      'dueDate': dueDate?.toIso8601String(),
      'type': 'urgent',
    };
  }
}

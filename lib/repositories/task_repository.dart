import 'dart:convert';
import 'dart:io';

import '../models/urgent_task.dart';
import 'repository.dart';

class TaskRepository implements Repository<UrgentTask> {
  final String filePath;

  TaskRepository(this.filePath);

  @override
  Future<List<UrgentTask>> getAll() async {
    final file = File(filePath);

    if (!await file.exists()) {
      return [];
    }

    final content = await file.readAsString();
    final data = jsonDecode(content) as List<dynamic>;

    return data.map((e) {
      final map = e as Map<String, dynamic>;
      return UrgentTask(
        title: map['title'] as String,
        dueDate: map['dueDate'] != null ? DateTime.parse(map['dueDate'] as String) : null,
      );
    }).toList();
  }

  @override
  Future<void> save(List<UrgentTask> tasks) async {
    final file = File(filePath);
    final directory = file.parent;

    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }

    await file.writeAsString(
      jsonEncode(tasks.map((task) => task.toJson()).toList()),
    );
  }
}

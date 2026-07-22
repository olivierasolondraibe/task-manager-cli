import 'dart:io';

import '../lib/models/urgent_task.dart';
import '../lib/repositories/task_repository.dart';
import '../lib/services/task_service.dart';

Future<void> main() async {
  final service = TaskService(TaskRepository('data/tasks.json'));

  while (true) {
    print('''
  1. Add Task
  2. List Tasks
  3. Complete Task
  4. Delete Task
  5. Exit
    ''');

    final choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        print('Title');
        final title = stdin.readLineSync() ?? '';
        if (title.isEmpty) {
          break;
        }
        await service.addTask(UrgentTask(title: title));
        print('Task added');
        break;

      case '2':
        final tasks = await service.getTask();
        for (var i = 0; i < tasks.length; i++) {
          print('${i} - ${tasks[i].title} [${tasks[i].completed ? 'Done' : 'Pending'}]');
        }
        break;

      case '3':
        print('Index');
        final idx = int.parse(stdin.readLineSync()!);
        await service.completed(idx);
        print('Task completed');
        break;

      case '4':
        print('Index');
        final idx = int.parse(stdin.readLineSync()!);
        await service.deleteTask(idx);
        print('Task deleted');
        break;

      case '5':
        exit(0);
    }
  }
}


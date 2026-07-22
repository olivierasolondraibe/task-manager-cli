import 'package:app/app.dart';
import 'package:test/test.dart';

void main() {
  test('Task title stored correctly', () {
    final task = UrgentTask(title: 'Learn Dart');

    expect(task.title, 'Learn Dart');
  });

  test('Task Completed', () {
    final task = UrgentTask(title: 'Test');

    task.markCompleted();

    expect(task.completed, isTrue);
  });

  test('Priority is high', () {
    final task = UrgentTask(title: 'Urgent');

    expect(task.priority.name, 'high');
  });

  test('JSON serialization', () {
    final task = UrgentTask(title: 'Demo');

    expect(task.toJson()['title'], 'Demo');
  });

  test('Completed default false', () {
    final task = UrgentTask(title: 'Task');

    expect(task.completed, isFalse);
  });
}

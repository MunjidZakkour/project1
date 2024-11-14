import 'dart:io';
import 'todos.dart';

void main() {
  Todos todos = Todos();

  print('Welcome in Todos App!');

  bool isWorking = true;

  while (isWorking) {
    List<String> sprint = [
      'Please select an option',
      '1. Add a new task',
      '2. Remove a task',
      '3. View all tasks',
      '4. Mark a task as completed',
      '5. Update task title',
      '6. Exit'
    ];
    sprint.forEach((s) => print(s));
    stdout.write('Select from 1 to ${sprint.length - 1}:');

    String? option = stdin.readLineSync();

    print('');
    switch (option) {
      case '1':
        stdout.write('Enter a task title: ');
        String? taskTitle = stdin.readLineSync();
        if (taskTitle != null) {
          todos.addTask(taskTitle);
        }
        break;
      case '2':
        stdout.write('Enter a task title: ');
        String? taskTitle = stdin.readLineSync();
        if (taskTitle != null) {
          todos.removeTask(taskTitle);
        }
        break;
      case '3':
        todos.viewTodos();
        break;
      case '4':
        stdout.write('Enter a task ID: ');
        String? taskIdString = stdin.readLineSync();
        int taskId = int.tryParse(taskIdString ?? '') ?? 0;
        if (taskId != 0) {
          todos.markTaskAsCompleted(taskId);
        }
        break;
      case '5':
        stdout.write('Enter a task ID: ');
        String? taskIdString = stdin.readLineSync();
        int taskId = int.tryParse(taskIdString ?? '') ?? 0;
        stdout.write('Enter a new title: ');
        String? newTitle = stdin.readLineSync();
        if (taskId != 0 && newTitle != null) {
          todos.updateTask(taskId, newTitle);
        }
        break;
      case '6':
        isWorking = false;
        break;
    }
  }
}

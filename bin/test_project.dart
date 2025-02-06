import 'dart:io';

import 'box_save.dart';
import 'task.dart';
import 'todos.dart';

void main() async {
  StorageBox storage = await StorageBox.init('myBox1', 'box_folder');
  String listKeyAtStorage = 'listKey';
  List byKey = storage.getByKey(listKeyAtStorage, <Task>[]);
  // print(byKey.runtimeType);
  Todos todos = Todos(byKey.cast<Task>());

  print('Welcome in Todos App!');
  bool isWorking = true;
  while (isWorking) {
    List<String> sprint = _printMessages();
    stdout.write('Select from 1 to ${sprint.length - 1}:\n');
    String? option = stdin.readLineSync();
    print('\n');
    switch (option) {
      case '1':
        _addTasks(todos);
        break;
      case '2':
        _removeTasks(todos);
        break;
      case '3':
        _viewTasks(todos);
        break;
      case '4':
        _markCompleted(todos);
        break;
      case '5':
        _updateTasks(todos);
        break;
      case '6':
        await _deleteAllTasks(storage, listKeyAtStorage, todos);
        break;
      case '7':
        await storage.save(listKeyAtStorage, todos.myList);
        isWorking = false;
        break;
    }
  }
}

Future<void> _deleteAllTasks(
    StorageBox storage, String listKeyAtStorage, Todos todos) async {
  await storage.deleteByKey(listKeyAtStorage);
  todos.clearTask();
  print('Deleted :)');
  print('');
}

void _updateTasks(Todos todos) {
  stdout.write('Enter a task ID: ');
  String? taskIdString = stdin.readLineSync();
  int taskId = int.tryParse(taskIdString ?? '') ?? 0;
  stdout.write('Enter a new title: ');
  String? newTitle = stdin.readLineSync();
  if (taskId != 0 && newTitle != null) {
    todos.updateTask(taskId, newTitle);
  }
}

void _markCompleted(Todos todos) {
  stdout.write('Enter a task ID: ');
  String? taskIdString = stdin.readLineSync();
  int taskId = int.tryParse(taskIdString ?? '') ?? 0;
  if (taskId != 0) {
    todos.markTaskAsCompleted(taskId);
  }
}

void _viewTasks(Todos todos) {
  print('The new tasks');
  todos.viewTodos();
  print('');
}

void _removeTasks(Todos todos) {
  stdout.write('Enter a task Id: ');
  String? taskId = stdin.readLineSync();
  todos.tryToRemoveTask(taskId);
  //Rearrange id List
  for (int i = 0; i < todos.myList.length; i++) {
    todos.myList[i].id = i + 1;
  }
}

void _addTasks(Todos todos) {
  stdout.write('Enter a task title: ');
  String? taskTitle = stdin.readLineSync();
  if (taskTitle != null) {
    todos.addTask(taskTitle);
  }
}

List<String> _printMessages() {
  List<String> sprint = [
    'Please select an option',
    '1. Add a new task',
    '2. Remove a task',
    '3. View all tasks',
    '4. Mark a task as completed',
    '5. Update task title',
    '6. Delete data',
    '7. Exit'
  ];

  for (String msg in sprint) {
    print(msg);
  }
  return sprint;
}

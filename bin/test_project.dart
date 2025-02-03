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
        stdout.write('Enter a task title: ');
        String? taskTitle = stdin.readLineSync();
        if (taskTitle != null) {
          todos.addTask(taskTitle);
        }
        break;
      case '2':
        stdout.write('Enter a task Id: ');
        String? taskId = stdin.readLineSync();
        todos.tryToRemoveTask(taskId);
        break;
      case '3':
        print('The new tasks');
        todos.viewTodos();
        print('*****************');
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
        // Todo: Make all needed action work with save action. (Ok?)
        await storage.save(listKeyAtStorage, todos.myList);
        break;
      case '7':
        await storage.deleteByKey(listKeyAtStorage);
        todos.clearTask();
        print('Deleted :)');
        break;
      case '8':
        isWorking = false;
        break;
    }
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
    '6. Save data',
    '7. Delete data',
    '8. Exit'
  ];
  
  for (String msg in sprint) {
    print(msg);
  }
  return sprint;
}

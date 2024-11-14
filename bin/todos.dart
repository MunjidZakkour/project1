import 'package:collection/collection.dart';

import 'task.dart';

class Todos {
  List<Task> taskList = [];

  void addTask(String title) {
    // Add task
    int id = taskList.length + 1;
    Task task = Task(id: id, title: title, isComplete: false);
    taskList.add(task);
  }

  void removeTask(int id) {
    // Remove task
    Task? task = taskList.firstWhereOrNull((element) => element.id == id);
    if (task == null){

    }
  }

  Task getTask(int index) {
    // Get task
    return taskList[index];
  }

  Task deletTask(int index) {
    return taskList.removeAt(index);
  }

  viewTodos() {
    //View todos
    if (taskList.isEmpty) {
      print('No tasks');
      return;
    }
    print('Current Todos:');
    for (Task task in taskList) {
      print(task);
    }
  }

  updateTask(int taskId, String title) {
    // Update task
    int indexWhere = taskList.indexWhere((Task task) {
      return task.id == taskId;
    });
    if (indexWhere < 0) {
      print('Task with ID $taskId not found');
    } else {
      Task task = taskList[indexWhere];
      task.title = title;
      print(task);
    }
  }

  void markTaskAsCompleted(int taskId) {
    // Completed task or not
    int indexWhere = taskList.indexWhere((Task task) {
      return task.id == taskId;
    });
    if (indexWhere < 0) {
      print('Task with ID $taskId not found');
    } else {
      Task task = taskList[indexWhere];
      task.isComplete = true;
      print(task);
    }
  }
}

import 'package:collection/collection.dart';
import 'task.dart';

class Todos {
  Todos(this.myList);
  List<Task> myList;
  void addTask(String title) {
    // Add task
    int id = myList.length + 1;
    Task task = Task(id: id, title: title, isComplete: false);
    myList.add(task);
  }

  void tryToRemoveTask(String? taskIdString) {
    int id = _getIdFromString(taskIdString);
    // Remove task
    int index = _findTaskIndex(id);
    if (index < 0) {
      print('Task with ID $id not found');
      return;
    }
    myList.removeAt(index);
  }

  Task getTask(int taskId) {
    // Get task
    return myList[taskId];
  }

  Task deleteTask(int taskId) {
    return myList.removeAt(taskId);
  }

  viewTodos() {
    //View todos
    if (myList.isEmpty) {
      print('No tasks');
      return;
    }
    print('Current Todos:');
    for (Task task in myList) {
      print(task);
    }
  }

  updateTask(int taskId, String title) {
    // Update task
    Task? task = _findTaskById(taskId);
    if (task == null) {
      print('Task with ID $taskId not found');
      return;
    }
    task.title = title;
    print(task);
  }

  void markTaskAsCompleted(int taskId) {
    // Completed task or not
    Task? task = _findTaskById(taskId);
    if (task == null) {
      print('Task with ID $taskId not found');
      return;
    }
    task.isComplete = true;
    print(task);
  }

  int _findTaskIndex(int taskId) {
    int indexWhere = myList.indexWhere((Task task) {
      return task.id == taskId;
    });
    return indexWhere;
  }

  int _getIdFromString(String? taskIdString) =>
      int.tryParse(taskIdString ?? '') ?? -1;

  Task? _findTaskById(int id) {
    Task? task = myList.firstWhereOrNull((Task element) => element.id == id);
    return task;
  }

  clearTask() {
    myList.clear();
  }
}

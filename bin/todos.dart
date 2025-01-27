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

  void tryToRemoveTask(String? taskIdString) {
    int id = _getIdFromString(taskIdString);
    // Remove task
    int index = _findTaskIndex(id);
    if (index < 0) {
      print('Task with ID $id not found');
      return;
    }
    taskList.removeAt(index);
  }

  Task getTask(int taskId) {
    // Get task
    return taskList[taskId];
  }

  Task deleteTask(int taskId) {
    return taskList.removeAt(taskId);
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
    int indexWhere = taskList.indexWhere((Task task) {
      return task.id == taskId;
    });
    return indexWhere;
  }

  int _getIdFromString(String? taskIdString) =>
      int.tryParse(taskIdString ?? '') ?? -1;

  Task? _findTaskById(int id) {
    Task? task = taskList.firstWhereOrNull((Task element) => element.id == id);
    return task;
  }
  clearTask(){
    taskList.clear();
  }
}

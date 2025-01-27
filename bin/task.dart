import 'package:hive/hive.dart';
part 'task.g.dart';
@HiveType(typeId: 1)
class Task {
  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  bool isComplete;

  Task({
    required this.id,
    required this.title,
    this.isComplete = false,
  });

  @override
  toString() {
    return 'Task: ($id), Title: $title, ${isComplete ? '[Yes]' : '[No]'}';
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'isComplete': isComplete};
  }

  factory Task.fromMap(Map<String, dynamic> mapTest) {
    return Task(
        id: mapTest['id'],
        title: mapTest['title'],
        isComplete: mapTest['isComplete'] ?? false);
  }
  factory Task.empty(){
    return Task(id: 0, title: "",isComplete: false);
  }
}

import 'package:hive/hive.dart';
part 'task_list.g.dart';
@HiveType(typeId: 2)
class TaskList {
  @HiveField(0)
  int id;

  TaskList({
    required this.id,
  });

}
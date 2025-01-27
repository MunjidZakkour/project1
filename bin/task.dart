class Task {
  int id;
  String title;
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
}

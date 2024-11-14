class Task {
  int id;
  String title;
  bool isComplete;

  Task ({
    required this.id,
    required this.title,
    this.isComplete = false,
});
@override
toString () {
return 'Task: ($id), Titel: $title, ${isComplete ? '[Yes]' : '[No]'}';
  }
}
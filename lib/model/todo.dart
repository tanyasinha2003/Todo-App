class ToDo {
  String? id;
  String? todoText;
  bool? isDone;

  ToDo({required this.id, required this.todoText, this.isDone = false});

  static List<ToDo> todoList() {
    return [
      ToDo(id: "1", todoText: "Complete todo", isDone: true),
      ToDo(id: "2", todoText: "Complete todo", isDone: true),
      ToDo(id: "3", todoText: "Complete todo", ),
      ToDo(id: "4", todoText: "Complete todo"),
    ];
  }
}

class Todo {
  int id;
  String heading;
  String description;
  Todo({required this.id, required this.heading, required this.description});

  static List<Todo> toTodoList(data) {
    List<Todo> list = [];
    for (var item in data) {
      list.add(Todo(
          id: item["id"],
          heading: item["heading"],
          description: item["description"]));
    }
    return list;
  }
}

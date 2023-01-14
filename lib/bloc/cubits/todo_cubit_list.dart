import 'package:flutter_bloc/flutter_bloc.dart';

class Todo {
  int id;
  String heading;
  String description;
  Todo({required this.id, required this.heading, required this.description});
}

class TodoListCubit extends Cubit<List<Todo>> {
  TodoListCubit()
      : super([
          Todo(
              id: 1,
              heading: "Todo heading one",
              description: "todo descripton one"),
          Todo(
              id: 2,
              heading: "Todo heading two",
              description: "todo descripton two"),
          Todo(
              id: 3,
              heading: "Todo heading three",
              description: "todo descripton three"),
          Todo(
              id: 4,
              heading: "Todo heading four",
              description: "todo descripton four"),
          Todo(
              id: 5,
              heading: "Todo heading five",
              description: "todo descripton five"),
        ]);

  // * adding new Todo to the list
  add(Todo t) {
    var arry = [...state];
    arry.add(t);
    emit(arry);
  }

  // * removing existing todo from the list
  remove(int id) {
    var arry = [...state];
    arry.removeWhere((element) => element.id == id);
    emit(arry);
  }
}

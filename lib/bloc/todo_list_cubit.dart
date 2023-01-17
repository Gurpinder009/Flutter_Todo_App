import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list3/database/model_classes/todo.dart';
import 'package:todo_list3/database/model_interfaces/todo_db.dart';

class TodoListCubit extends Cubit<List<Todo>> {
  TodoListCubit() : super([]);
  add(Todo t) async {
    var arry = [...state];
    bool res = await TodoDB.insertTodoData(t);
    if (res) {
      arry.add(t);
    }
    emit(arry);
  }

  // * removing existing todo from the list
  remove(int id) {
    var arry = [...state];
    arry.removeWhere((element) => element.id == id);
    emit(arry);
  }

  loadData() async {
    List<Todo> data = await TodoDB.getTodoData();
    log("data is loaded ${data.toString()}");
    emit(data);
  }
}

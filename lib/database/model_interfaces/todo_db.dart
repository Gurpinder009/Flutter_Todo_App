import 'dart:developer';

import 'package:todo_list3/database/database_connection.dart';
import 'package:todo_list3/database/model_classes/todo.dart';

class TodoDB {
  static Future<List<Todo>> getTodoData() async {
    final instance = await DatabaseConnection.getInstance();
    List<Todo> todoList = [];

    // await instance.execute(
    //     "create table todo(id integer primary key autoincrement,heading text not null,description text);");
    todoList = Todo.toTodoList(await instance.rawQuery("select * from todo"));
    return todoList;
  }

  static Future<Todo>? getTodoDataOne(int id) async {
    final instance = await DatabaseConnection.getInstance();
    final row = Todo.toTodoList(
        await instance.rawQuery("select * from todo where id = ?", [id]));
    return row.first;

    // return Todo(id, heading: heading, description: description);
  }

  static Future<bool> insertTodoData(Todo t) async {
    final instance = await DatabaseConnection.getInstance();
    final int res = await instance.rawInsert(
        "insert into todo(id,heading,description)values(?,?,?)",
        [t.id, t.heading, t.description]);
    return (res != 0) ? true : false;
  }

  static Future<bool> deleteTodoData(int id) async {
    final instance = await DatabaseConnection.getInstance();
    final int res =
        await instance.rawDelete("delete from todo where id = ?", [id]);
    log(res.toString());
    return (res != 0) ? true : false;
  }
}

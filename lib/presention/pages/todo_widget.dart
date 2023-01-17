import "package:flutter/material.dart";
import 'package:todo_list3/database/model_interfaces/todo_db.dart';
import 'package:todo_list3/presention/layout/with_layout.dart';

class TodoPage extends StatelessWidget {
  final int id;
  const TodoPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return withLayout(
        context: context,
        child: FutureBuilder(
            future: TodoDB.getTodoDataOne(id),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text((snapshot.data != null)
                    ? snapshot.data!.heading
                    : "safklsad");
              } else if (snapshot.connectionState != ConnectionState.waiting) {
                return const Text("waiting");
              } else {
                return const Text("error");
              }
            }));
  }
}

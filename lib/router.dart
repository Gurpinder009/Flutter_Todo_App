import "package:flutter/material.dart";
import 'package:go_router/go_router.dart';
import 'package:todo_list3/presention/animation/with_fade_transition.dart';
import 'package:todo_list3/presention/layout/with_layout.dart';
import 'package:todo_list3/presention/pages/add_todo_page_widget.dart';
import 'package:todo_list3/presention/pages/home_page_widget.dart';
import 'package:todo_list3/presention/pages/todo_page_widget.dart';

var router = GoRouter(routes: [
  GoRoute(
      path: "/",
      pageBuilder: (context, state) {
        return withFadeTransition(child: const HomePageWidget());
      }),
  GoRoute(
      path: "/todo/:id",
      name: "/todo",
      pageBuilder: (context, state) {
        if (state.params["id"] != null) {
          return withFadeTransition(
              child: TodoPageWidget(
            id: int.parse(state.params["id"]!),
          ));
        }
        return withFadeTransition(
            child:
                withLayout(context: context, child: const Text("not working")));
      }),
  GoRoute(
      path: "/about",
      pageBuilder: (context, state) {
        return withFadeTransition(child: const AddTodoPageWidget());
      })
], debugLogDiagnostics: true);

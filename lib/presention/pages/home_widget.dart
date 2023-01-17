import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list3/bloc/todo_list_cubit.dart';
import 'package:todo_list3/database/model_classes/todo.dart';
import 'package:todo_list3/presention/layout/with_layout.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return withLayout(
        context: context,
        child: BlocBuilder<TodoListCubit, List<Todo>>(
            builder: (context, state) => ListView.builder(
                  itemCount: state.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              // color: Color.fromARGB(77, 175, 175, 175),
                              ),
                          child: InkWell(
                              highlightColor:
                                  const Color.fromARGB(66, 38, 38, 38),
                              onTap: () {
                                GoRouter.of(context).pushNamed("/todo",
                                    params: {"id": state[index].id.toString()});
                              },
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 18, horizontal: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state[index].heading,
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 5, 0, 0),
                                        child: Text(
                                          maxLines: 1,
                                          overflow: TextOverflow.clip,
                                          state[index].description,
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                      ),
                                    ],
                                  ))),
                        ),
                        const Divider(
                          height: 2,
                          thickness: 1,
                        )
                      ],
                    );
                  },
                )));
  }
}

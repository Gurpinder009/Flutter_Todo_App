import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/bloc/cubits/todo_cubit_list.dart';
import 'package:todo_list/components/utility_widgets/with_layout.dart';

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
                                print(state[index].heading);
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

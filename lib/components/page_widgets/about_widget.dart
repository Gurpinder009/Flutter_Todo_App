import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/bloc/cubits/todo_cubit_list.dart';
// import 'package:todo_list/Bloc/counter_cubit.dart';
import "../utility_widgets/with_layout.dart";

class AboutWidget extends StatelessWidget {
  const AboutWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return withLayout(context: context, child: const AddTodoWidget());
  }
}

class AddTodoWidget extends StatefulWidget {
  const AddTodoWidget({super.key});
  @override
  State<AddTodoWidget> createState() => _AddTodoWidgetState();
}

class _AddTodoWidgetState extends State<AddTodoWidget> {
  var name = GlobalKey<FormState>();
  var data = <String, String?>{"heading": null, "description": null};
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                  key: name,
                  child: Column(
                    children: [
                      Text(
                        "Add Todo",
                        style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          autofocus: true,
                          validator: (value) {
                            if (value!.runes.length < 3) {
                              return "Data is not available";
                            }
                            return null;
                          },
                          onChanged: ((value) {
                            setState(() {
                              data["heading"] = value;
                            });
                          }),
                          decoration: const InputDecoration(
                              labelText: "Todo Header",
                              border: OutlineInputBorder()),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: TextFormField(
                          textInputAction: TextInputAction.done,
                          validator: (value) {
                            if (value!.runes.length < 3) {
                              return "Data is not available";
                            }
                            return null;
                          },
                          minLines: 6,
                          maxLines: null,
                          onChanged: ((value) {
                            setState(() {
                              data["description"] = value;
                            });
                          }),
                          decoration: const InputDecoration(
                              hintText: "Your data...",
                              border: OutlineInputBorder()),
                        ),
                      )
                    ],
                  )),
              ElevatedButton(
                  onPressed: () {
                    if (name.currentState!.validate()) {
                      BlocProvider.of<TodoListCubit>(context).add(Todo(
                          id: 6,
                          heading: data["heading"]!,
                          description: data["description"]!));
                      var snackbar = const SnackBar(
                        content: Text("Your todo is added in the list "),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      setState(() {
                        data = {"heading": null, "description": null};
                      });
                      name.currentState!.reset();
                      // Future.delayed(const Duration(seconds: 1),
                      //     (() => GoRouter.of(context).pop()));
                      GoRouter.of(context).pop();
                    }
                  },
                  child: const Text("Submit Form"))
            ],
          ),
        ));
  }
}

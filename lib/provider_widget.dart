//** Initializing your App with Bloc Providers */
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/authentication.dart';
import 'package:todo_list/bloc/cubits/google_sign_in_cubit.dart';
import 'package:todo_list/bloc/cubits/todo_cubit_list.dart';

class ProviderWidget extends StatelessWidget {
  const ProviderWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<GoogleSignInCubit>(create: (context) => GoogleSignInCubit()),
      BlocProvider<TodoListCubit>(
        create: (context) => TodoListCubit(),
      )
    ], child: const AuthenicationWidget());
  }
}

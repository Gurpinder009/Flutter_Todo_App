//** Initializing your App with Bloc Providers */
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list3/bloc/google_sign_in_cubit.dart';
import 'package:todo_list3/bloc/todo_list_cubit.dart';
import 'package:todo_list3/presention/authentication.dart';

class ProviderWidget extends StatelessWidget {
  const ProviderWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<GoogleSignInCubit>(create: (context) => GoogleSignInCubit()),
      BlocProvider<TodoListCubit>(
          create: (context) => TodoListCubit()..loadData())
    ], child: const AuthenicationWidget());
  }
}

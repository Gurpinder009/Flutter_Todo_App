import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list3/bloc/google_sign_in_cubit.dart';

Widget withLayout(
    {required BuildContext context,
    required Widget child,
    String title = "Appbar"}) {
  return Scaffold(
      appBar: AppbarWidget(
        title: title,
      ).build(context),
      body: SafeArea(child: Center(child: child)),
      floatingActionButton: FloatingActionButtonWidget().build(context));
}

class AppbarWidget {
  final String title;
  const AppbarWidget({required this.title});

  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          child: Text(title)),
      actions: [
        IconButton(
            onPressed: () {
              BlocProvider.of<GoogleSignInCubit>(context).signOut();
              // FirebaseAuth.instance.signOut();
            },
            icon: const Icon(Icons.logout)),
        const Padding(padding: EdgeInsets.only(right: 10))
      ],
      elevation: 2,
      titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: "NotoSerifNPHmong"),
    );
  }
}

class FloatingActionButtonWidget {
  Widget? build(BuildContext context) {
    return ((GoRouter.of(context).location != "/about")
        ? FloatingActionButton(
            onPressed: () {
              GoRouter.of(context).push("/about");
            },
            child: const Icon(Icons.add),
          )
        : null);
  }
}

import "package:flutter/material.dart";
import 'package:go_router/go_router.dart';

Widget withLayout(
    {required BuildContext context,
    required Widget child,
    String title = "Appbar"}) {
  return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(4),
          child: Text(title),
        ),
        elevation: 2,
        titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: "NotoSerifNPHmong"),
        // backgroundColor: const Color.fromRGBO(100, 100, 100, 0.8)
        // foregroundColor: Colors.black87,
      ),
      body: SafeArea(child: Center(child: child)),
      floatingActionButton: (GoRouter.of(context).location != "/about")
          ? FloatingActionButton(
              onPressed: () {
                GoRouter.of(context).push("/about");
              },
              child: const Icon(Icons.add),
            )
          : null);
}

//
// (GoRouter.of(context).location == "/about")?
// floatingActionButton: FloatingActionButton(onPressed: (){
// GoRouter.of(context).go("/about");
// },child: const Icon(Icons.add),):null,
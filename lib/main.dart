import 'package:flutter/material.dart';
import 'package:todo_list/components/others/router_list.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme:ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(245,245, 245, 1),
          // floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor:Color.fromRGBO(100, 100, 100, 0.8) )
      ),
      routerConfig: router,
    );
  }
}

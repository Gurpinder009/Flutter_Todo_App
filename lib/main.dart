//** Initializing flutter app with firebase */

import 'package:flutter/material.dart';
import "package:firebase_core/firebase_core.dart";
import 'package:todo_list3/provider_widget.dart';
import "firebase_options.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const ProviderWidget();
  }
}

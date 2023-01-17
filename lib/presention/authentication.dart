import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list3/bloc/google_sign_in_cubit.dart';
import 'package:todo_list3/router.dart';

class AuthenicationWidget extends StatelessWidget {
  const AuthenicationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const MaterialApp(
              home: Text("waiting"),
            );
          } else if (snapshot.hasData) {
            return MaterialApp.router(
              theme: ThemeData(
                scaffoldBackgroundColor: const Color.fromRGBO(245, 245, 245, 1),
              ),
              routerConfig: router,
            );
          } else if (snapshot.hasError) {
            return MaterialApp(
              home: Text(snapshot.error.toString()),
            );
          } else {
            return const MaterialApp(
              home: Scaffold(
                body: SafeArea(
                    child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: LoginFormWidget(),
                )),
              ),
            );
          }
        }));
  }
}

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Center(
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        // mainAxisAlignment: MainAxisAlignment.center,
        shrinkWrap: true,
        children: [
          Center(
              child: Text(
            "Sign In",
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor),
          )),
          const Padding(padding: EdgeInsets.only(top: 25)),
          TextFormField(
            decoration: const InputDecoration(
                label: Text("Enter Email"), border: OutlineInputBorder()),
          ),
          const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0)),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
                label: Text("Enter Password"), border: OutlineInputBorder()),
          ),
          const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0)),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 58), elevation: 4),
              onPressed: () async {
                // await signInWith
              },
              child: const Text("Login")),
          const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0)),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 58),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black54,
                  elevation: 4),
              onPressed: () async {
                BlocProvider.of<GoogleSignInCubit>(context).signIn();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.g_translate),
                  Padding(padding: EdgeInsets.only(right: 5)),
                  Text("Sign In with Google"),
                ],
              ))
        ],
      ),
    ));
  }
}

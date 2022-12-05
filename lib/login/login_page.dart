import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/auth_bloc.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Sign In",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Bienvenido a SignApp",
              style: TextStyle(
                color: Color.fromARGB(255, 3, 58, 104),
                fontSize: 30,
              ),
            ),
            MaterialButton(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Iniciar sesión con Google",
                      style: TextStyle(color: Colors.white,fontSize: 15,),
                    ),
                  ],
                ),
                color: Colors.green,
                minWidth: MediaQuery.of(context).size.width - 30,
                onPressed: () {
                  BlocProvider.of<AuthBloc>(context).add(GoogleAuthEvent());
                }),
          ],
        ),
      ),
    );
  }
}

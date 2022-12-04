import 'package:flutter/material.dart';
import 'package:signapp/bottomnavbar.dart';
import 'login/bloc/auth_bloc.dart';
import 'login/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    //poner los bloc necesarios
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc()..add(VerifyAuthEvent()),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.dark(),
        primaryColor: Colors.purple,
      ),
      title: 'FindTrackApp',
      home: BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
        if (state is AuthErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Error en la autenticación"),
          ));
        }
      }, builder: (context, state) {
        if (state is AuthSuccessState) {
          return botomnavbar();
        } else if (state is AuthFailState ||
            state is AuthErrorState ||
            state is SignOutSuccessState) {
          return LoginPage();
        } else {
          return Center(
            child: CircularProgressIndicator(color: Colors.purple),
          );
        }
      }),
    );
  }
}

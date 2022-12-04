import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login/bloc/auth_bloc.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account"),
      ),
      body: Center(
        child: IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (builder) => AlertDialog(
                title: Text("Cerrar sesión"),
                content: Text(
                    "Al cerrar sesión de su cuenta será redirigido a la pantalla de Log in, ¿Quiere continuar?"),
                actions: [
                  TextButton(
                    child: Text("Cancelar"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text("Cerrar sesión"),
                    onPressed: () {
                      Navigator.of(context).pop();
                      BlocProvider.of<AuthBloc>(context)..add(SignOutEvent());
                    },
                  ),
                ],
              ),
            );
          },
          icon: CircleAvatar(
            child: Icon(Icons.power_settings_new),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
        ),
      ),
    );
  }
}

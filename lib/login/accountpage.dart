import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/auth_bloc.dart';
import 'auth.dart';

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
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://lh3.googleusercontent.com/a/ALm5wu2vZthKpBaSvG5n-_1acRcPFPWaCHuGjppzX-VsSg=s96-c"),
                      fit: BoxFit.fill),
                ),
              ),
              Text(
                "blaz545",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
              Text(
                "blaz545@gmail.com",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              IconButton(
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
                            BlocProvider.of<AuthBloc>(context)
                              ..add(SignOutEvent());
                          },
                        ),
                      ],
                    ),
                  );
                },
                icon: CircleAvatar(
                  child: Icon(Icons.power_settings_new),
                  backgroundColor: Color.fromARGB(255, 59, 59, 59),
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

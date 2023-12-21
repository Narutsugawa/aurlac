import 'package:aurlac/acceuil.dart';
import 'package:aurlac/models/database_helper.dart';
import 'package:aurlac/models/provider_model/user_name_psswd.dart';
import 'package:aurlac/models/user.dart';
import 'package:aurlac/widgets/filled_button_yellow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Ctrl Username & Password
  final userNameCtrl = TextEditingController();
  final psswdCtrl = TextEditingController();

  // Logique pour connexion
  String _username = '';
  String _password = '';

  void _loginButtonPressed(String username, String password) async {
    if (await _isValidCredentials(username, password)) {
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(builder: (BuildContext context) => const Acceuil()),
      );
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Nom d\'utilisateur ou mot de passe incorrect.'),
        ),
      );
    }
  }

  // Booleen pour le message d'erreur
  _isValidCredentials(String username, String password) async {
    List<User> users = await DatabaseHelper.getUsers();
    return users
        .any((user) => user.username == username && user.password == password);
  }

  // Insertion d'utilisateur
  Future<void> insertUser() async {
    User user = User(username: "employé1", password: "qwerty123456");
    await DatabaseHelper.insertUser(user);
  }

  // Récupération de la liste des utilisateurs
  Future<void> getUsers() async {
    List<User> users = await DatabaseHelper.getUsers();
    print('La liste des utilisateurs : $users');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 228, 94),
          title: Text(
            widget.title,
            style: const TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/aurlac_decopassion.webp",
                fit: BoxFit.cover,
              ),
              const Center(
                child: Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const IconButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStatePropertyAll(Colors.white),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.grey),
                          ),
                          icon: Icon(Icons.person),
                          onPressed: (null),
                          iconSize: 27,
                        ),
                        const SizedBox(width: 20),
                        SizedBox(
                          width: 250,
                          child: TextField(
                            controller: userNameCtrl,
                            keyboardType: TextInputType.name,
                            onChanged: (value) {
                              setState(() {
                                _username = userNameCtrl.text;
                                context.read<UserNameAndPsswd>().userName =
                                    _username;
                              });
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              hintText: 'Username',
                              contentPadding:
                                  const EdgeInsets.only(left: 30, right: 30),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const IconButton.filled(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStatePropertyAll(Colors.white),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.grey),
                          ),
                          icon: Icon(Icons.lock),
                          onPressed: (null),
                          iconSize: 27,
                        ),
                        const SizedBox(width: 20),
                        SizedBox(
                          width: 250,
                          child: TextField(
                            controller: psswdCtrl,
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              setState(() {
                                _password = psswdCtrl.text;
                                context.read<UserNameAndPsswd>().secretword =
                                    _password;
                              });
                            },
                            enableSuggestions: false,
                            obscureText: true,
                            obscuringCharacter: '*',
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              hintText: 'Password',
                              contentPadding:
                                  const EdgeInsets.only(left: 30, right: 30),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: Column(
                  children: [
                    FilleButtonYellow(
                      onPressed: _loginButtonPressed,
                    ),
                    TextButton(
                      onPressed: () async {
                        await insertUser();

                        await getUsers();
                      },
                      child: const Text(
                        'Forgot password',
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

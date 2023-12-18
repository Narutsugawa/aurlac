import 'package:aurlac/home.dart';
import 'package:aurlac/models/database_helper.dart';
import 'package:aurlac/models/provider_model/user_name_psswd.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialiser la base de donnée
  await DatabaseHelper.initDatabase();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserNameAndPsswd())
      ],
      child: MaterialApp(
        darkTheme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        title: 'Aurlac',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Aurlac'),
      ),
    );
  }
}

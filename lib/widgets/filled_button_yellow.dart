import 'package:aurlac/models/provider_model/user_name_psswd.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilleButtonYellow extends StatefulWidget {
  const FilleButtonYellow({Key? key, required this.onPressed})
      : super(key: key);

  final Function(String username, String password) onPressed;

  @override
  State<FilleButtonYellow> createState() => _FilleButtonYellowState();
}

class _FilleButtonYellowState extends State<FilleButtonYellow> {
  String _username = '';
  String _password = '';
  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(const Size.fromWidth(180)),
        backgroundColor: const MaterialStatePropertyAll(
          Color.fromARGB(255, 255, 228, 94),
        ),
        overlayColor: const MaterialStatePropertyAll(Colors.yellow),
      ),
      onPressed: () {
        // Take userName&Password from provider
        _username =
            Provider.of<UserNameAndPsswd>(context, listen: false).userName;
        _password =
            Provider.of<UserNameAndPsswd>(context, listen: false).secretword;
        widget.onPressed(_username, _password);
      },
      child: const Text(
        'Log in',
        style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w700),
      ),
    );
  }
}

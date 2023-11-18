import 'package:flutter/material.dart';

class FilleButtonYellow extends StatefulWidget {
  const FilleButtonYellow({super.key});

  @override
  State<FilleButtonYellow> createState() => _FilleButtonYellowState();
}

class _FilleButtonYellowState extends State<FilleButtonYellow> {
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
      onPressed: () {},
      child: const Text(
        'Log in',
        style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w700),
      ),
    );
  }
}

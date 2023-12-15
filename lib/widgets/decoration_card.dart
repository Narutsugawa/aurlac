import 'package:flutter/material.dart';

class DecorationCard extends StatelessWidget {
  const DecorationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10.0,
          bottom: 10.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/images/aurlac.jpg',
              fit: BoxFit.fill,
              width: 100.0,
              height: 100.0,
            ),
            Image.asset(
              'assets/images/Aurlac-magasin-de-peintures.webp',
              fit: BoxFit.cover,
              width: 150.0,
              height: 100.0,
            ),
          ],
        ),
      ),
    );
  }
}

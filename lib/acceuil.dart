import 'package:aurlac/widgets/decoration_card.dart';
import 'package:aurlac/widgets/icon_button_acceuil.dart';
import 'package:flutter/material.dart';

class Acceuil extends StatefulWidget {
  const Acceuil({super.key});

  @override
  State<Acceuil> createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 5,
          shadowColor: Colors.black54,
          actions: [
            Row(
              children: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.notifications)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
              ],
            )
          ],
          backgroundColor: const Color.fromARGB(255, 255, 228, 94),
          title: const Text(
            'Aurlac',
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                Container(
                  width: size.width,
                  height: 250,
                  color: const Color.fromARGB(255, 255, 228, 94),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, top: 25),
                  child: ClipOval(
                    child: Image.asset(
                      "assets/images/aurlac_decopassion.webp",
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 175, top: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'AURLAC',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        'aurlac@mada.com',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: Colors.black54,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40, top: 210),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.words,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.grey,
                      contentPadding: EdgeInsets.all(20.0),
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 60, left: 10, right: 10),
                child: IconButtonAcceuil(),
              ),
            ),
            const DecorationCard(),
          ],
        ),
      ),
    );
  }
}

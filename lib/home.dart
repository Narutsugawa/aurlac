import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
              Image.network(
                'https://akamamadagascar.files.wordpress.com/2013/09/aurlac_decopassion.png?w=870&h=653',
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
                            keyboardType: TextInputType.name,
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
                          icon: Icon(Icons.mail),
                          onPressed: (null),
                          iconSize: 27,
                        ),
                        const SizedBox(width: 20),
                        SizedBox(
                          width: 250,
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              hintText: 'username@exemple.com',
                              contentPadding:
                                  const EdgeInsets.only(left: 30, right: 30),
                            ),
                          ),
                        )
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
                            keyboardType: TextInputType.text,
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
                    FilledButton(
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(
                            const Size.fromWidth(180)),
                        backgroundColor: const MaterialStatePropertyAll(
                          Color.fromARGB(255, 255, 228, 94),
                        ),
                        overlayColor:
                            const MaterialStatePropertyAll(Colors.yellow),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Log in',
                        style: TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.w700),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot password',
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 200),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Don\'t have an account?',
                          style: TextStyle(
                            color: Colors.black54,
                          ),
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

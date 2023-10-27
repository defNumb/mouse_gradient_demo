import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // init state
  // gradient center
  Alignment gradientCenter = Alignment.center;
  @override
  Widget build(BuildContext context) {
    // screen width
    final double screenWidth = MediaQuery.of(context).size.width;
    // screen height
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: MouseRegion(
        onHover: (event) {
          // set state to update the offset
          setState(() {
            gradientCenter = Alignment(
              2 * (event.localPosition.dx / screenWidth) - 1,
              2 * (event.localPosition.dy / screenHeight) - 1,
            );
          });
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  radius: 1.3,
                  center: gradientCenter,
                  stops: const [0.0, 1.0],
                  colors: const [
                    Color.fromARGB(255, 26, 40, 66),
                    Color.fromARGB(255, 24, 6, 27),
                  ],
                ),
              ),
            ),
            // YOUR CONTENT HERE
            Positioned(
              // center
              top: screenHeight / 2.5,
              left: screenWidth / 3,
              right: 0,
              child: const SizedBox(
                height: 500,
                width: 500,
                child: Text(
                  'MUNDO FLUTTER',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter',
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

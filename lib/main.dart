import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
      MaterialApp(
        home: BallPage(),
      ),
    );

// BallPage is the "screen" of the app (StatelessWidget)
class BallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('Ask Me Anything'),
        backgroundColor: const Color.fromARGB(255, 5, 63, 110),
      ),
      // The main body of the screen is handled by a StatefulWidget (Ball)
      body: Ball(),
    );
  }
}

// Ball is a StatefulWidget → used when something changes over time (state changes)
class Ball extends StatefulWidget {
  const Ball({super.key});

  @override
  _BallState createState() => _BallState();
}

// The actual "state" of the Ball widget lives here
class _BallState extends State<Ball> {
  int ballNumber = 3; // stores which ball image to show

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          // Expanded makes sure the child takes up all available space
          // inside a Column/Row → useful for responsiveness on different screens
          child: Center(
            // Center puts its child in the middle of the screen
            child: Padding(
              padding: EdgeInsets.all(16),
              child: TextButton(
                onPressed: () {
                  // setState is VERY IMPORTANT:
                  // it tells Flutter to rebuild this widget with new values
                  setState(() {
                    // Randomly generate ballNumber between 1 and 5
                    // nextInt(4) gives 0..3 → +1 makes it 1..4
                    ballNumber = Random().nextInt(4) + 1;
                  });

                  print('ballnumber = $ballNumber');
                },
                // The child of the button is the dice image
                child: Image.asset(
                  "images/ball$ballNumber.png",
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

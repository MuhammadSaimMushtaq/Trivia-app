import 'package:flutter/material.dart';
import 'package:trivia/pages/game.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double? deviceheight;
  double? devicewidth;
  double difficulty = 0;
  List difficultytext = ['easy', 'medium', 'hard'];

  @override
  Widget build(BuildContext context) {
    deviceheight = MediaQuery.of(context).size.height;
    devicewidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: deviceheight! * 0.05),
      color: const Color.fromRGBO(31, 31, 31, 1.0),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SizedBox(
              height: deviceheight! * 0.2,
              child: Column(
                children: [
                  const Text(
                    'Trivia',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                  Text(
                    difficultytext[difficulty.toInt()],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Slider(
              value: difficulty,
              onChanged: (value) {
                setState(() {
                  difficulty = value;
                });
              },
              min: 0,
              max: 2,
              divisions: 2,
            ),
            SizedBox(
              height: deviceheight! * 0.1,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Gamepage(
                      difficulty: difficultytext[difficulty.toInt()],
                    );
                  }));
                },
                color: Colors.green,
                height: deviceheight! * 0.1,
                minWidth: devicewidth! * 0.8,
                child: const Text(
                  'Start Game',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

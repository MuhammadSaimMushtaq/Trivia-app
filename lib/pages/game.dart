import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trivia/pages/gameproider.dart';

class Gamepage extends StatelessWidget {
  Gamepage({super.key, required this.difficulty});
  Gamepageprovider? _gamepageprovider;
  String? answer;
  String difficulty;

  @override
  Widget build(BuildContext context) {
    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;

    Widget questions() {
      return Text(
        _gamepageprovider!.getQuestion(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      );
    }

    Widget button(type) {
      return MaterialButton(
        onPressed: () {
          type == true ? answer = 'True' : answer = 'False';
          _gamepageprovider!.checkAnswer(answer!);
        },
        color: type == true ? Colors.green : Colors.red,
        height: deviceheight * 0.1,
        minWidth: devicewidth * 0.8,
        child: Text(type.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            )),
      );
    }

    Widget buildUI() {
      return Builder(builder: (context) {
        _gamepageprovider = context.watch<Gamepageprovider>();
        if (_gamepageprovider!.questions != null) {
          return Scaffold(
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: deviceheight * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  questions(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      button(true),
                      SizedBox(
                        height: deviceheight * 0.01,
                      ),
                      button(false),
                    ],
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        }
      });
    }

    return ChangeNotifierProvider(
      create: (context) =>
          Gamepageprovider(context: context, difficulty: difficulty),
      child: buildUI(),
    );
  }
}

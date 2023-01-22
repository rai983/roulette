import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:practice/components/raisedButton.dart';
import 'package:practice/screens/roulette_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  String title = 'roulette';
  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    animation =
        ColorTween(begin: Colors.yellow, end: Colors.white).animate(controller);

    controller.forward();

    animation.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: Container(
                      child: Image.asset('images/roulette.png'),
                      height: 50.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                  ),
                  DefaultTextStyle(
                    style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        WavyAnimatedText(title),
                        WavyAnimatedText('try and go'),
                      ],
                      isRepeatingAnimation: true,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              RaisedButton(
                buttonTitle: 'press here to start',
                colour: Colors.lightBlueAccent,
                onPressed: () {
                  Navigator.pushNamed(context, RouletteScreen.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

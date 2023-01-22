import 'package:flutter/material.dart';

class RaisedButton extends StatelessWidget {
  // RaisedButton(
  //     {required this.colour,
  //     required this.buttonTitle,
  //     required this.onPressed});
  const RaisedButton(
      {Key? key,
      required this.colour,
      required this.buttonTitle,
      required this.onPressed})
      : super(key: key);

  final Color colour;
  final String buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            buttonTitle,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

// highlightElevation: 16,
// highlightColor: Colors.blue,
// onHighlightChanged: (value) {},

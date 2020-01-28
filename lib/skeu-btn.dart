import 'package:flutter/material.dart';

import 'functions.dart';

class SkeuButton extends StatefulWidget {
  final String text;

  final void Function() onPressed;

  const SkeuButton({Key key, this.text, this.onPressed}) : super(key: key);

  @override
  _SkeuButtonState createState() => _SkeuButtonState();
}

class _SkeuButtonState extends State<SkeuButton> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        setState(() {
          this.pressed = true;
        });
      },
      onTapUp: (TapUpDetails details) {
        setState(() {
          this.pressed = false;
        });
        this.widget.onPressed();
      },
      child: Container(
        decoration: getDecoration(this.pressed),
        child: Center(
            child: Text(
          this.widget.text,
          style: TextStyle(fontSize: 24),
        )),
      ),
    );
  }
}

import 'package:flutter/material.dart';

const double OFFSET = 3;
const double BLUR = 6;

BoxDecoration getDecoration([bool pressed = false]) {
  return BoxDecoration(
      border: Border.all(color: Colors.white.withOpacity(0.05), width: 1),
      borderRadius: BorderRadius.circular(15),
      boxShadow: [getWhiteShadow(pressed), getBlackShadow(pressed)]);
}

BoxShadow getBlackShadow(bool pressed) {
  var offset = pressed ? Offset(-OFFSET, -OFFSET) : Offset(OFFSET, OFFSET);
  return BoxShadow(color: Colors.black12, blurRadius: BLUR, offset: offset);
}

BoxShadow getWhiteShadow(bool pressed) {
  var offset = !pressed ? Offset(-OFFSET, -OFFSET) : Offset(OFFSET, OFFSET);
  return BoxShadow(
      color: Colors.white.withOpacity(0.5), blurRadius: BLUR, offset: offset);
}

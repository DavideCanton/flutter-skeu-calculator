import 'package:flutter/material.dart';

const double OFFSET_BLACK = 5;
const double OFFSET_WHITE = -6;
const double OFFSET_PRESSED_WHITE = 5;
const double OFFSET_PRESSED_BLACK = -6;
const double BLUR = 10;

BoxDecoration getDecoration([bool pressed = false]) {
  return BoxDecoration(
      border: Border.all(color: Colors.white.withOpacity(0.05), width: 1),
      borderRadius: BorderRadius.circular(15),
      color: Color(0xFFeaebf3),
      boxShadow: [getWhiteShadow(pressed), getBlackShadow(pressed)]);
}

BoxShadow getBlackShadow(bool pressed) {
  if (pressed) {
    return BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: BLUR,
        offset: Offset(OFFSET_PRESSED_BLACK, OFFSET_PRESSED_BLACK));
  } else {
    return BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: BLUR,
        offset: Offset(OFFSET_BLACK, OFFSET_BLACK));
  }
}

BoxShadow getWhiteShadow(bool pressed) {
  if (!pressed) {
    return BoxShadow(
        color: Colors.white.withOpacity(0.8),
        blurRadius: BLUR,
        offset: Offset(OFFSET_WHITE, OFFSET_WHITE));
  } else {
    return BoxShadow(
        color: Colors.white.withOpacity(0.8),
        blurRadius: BLUR,
        offset: Offset(OFFSET_PRESSED_WHITE, OFFSET_PRESSED_WHITE));
  }
}

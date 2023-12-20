import 'dart:ui';

import 'package:flutter/material.dart';

TextStyle getnotificationtabunselected() {
  return const TextStyle(
      color: Colors.blueGrey,
      fontWeight: FontWeight.w500,
      fontFamily: "Roboto-Medium",
      fontStyle: FontStyle.normal,
      fontSize: 12);
}

TextStyle getnotificatontabselected() {
  return const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontFamily: "Roboto-SemiBold",
      fontStyle: FontStyle.normal,
      fontSize: 13);
}

List<BoxShadow> getCardShadow() {
  return [
    BoxShadow(
        color: Color(0x26000000),
        offset: Offset(0, 2),
        blurRadius: 4,
        spreadRadius: 0)
  ];
}

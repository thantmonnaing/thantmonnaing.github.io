import 'package:flutter/material.dart';

const kTextColor = Color(0xFF0AE9B9);
const kTextLightColor = Color(0xFF555555);
const kMainColor = Color(0xFF11162A);
const kUnSelectedColor = Color(0xFFC8C8C8);
const kNameTextColor = Color(0xFF71D1F1);
const kWhiteTextColor = Color(0xFFFFFFFF);
const kProgressColor = Color(0xFF0AE9B9);

const kDefaultPadding = 20.0;

final kDefaultShadow = BoxShadow(
  offset: const Offset(0, 50),
  blurRadius: 50,
  color: const Color(0xFF0700B1).withOpacity(0.15),
);

final kDefaultCardShadow = BoxShadow(
  offset: const Offset(0, 20),
  blurRadius: 50,
  color: Colors.black.withOpacity(0.1),
);

// TextField dedign
const kDefaultInputDecorationTheme = InputDecorationTheme(
  border: kDefaultOutlineInputBorder,
  enabledBorder: kDefaultOutlineInputBorder,
  focusedBorder: kDefaultOutlineInputBorder,
);

const kDefaultOutlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: Color(0xFFCEE4FD),
  ),
);

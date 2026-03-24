import 'package:flutter/material.dart';

bool isCompactWidth(BuildContext context) =>
    MediaQuery.sizeOf(context).width < 600;

bool isMediumWidth(BuildContext context) {
  final w = MediaQuery.sizeOf(context).width;
  return w >= 600 && w < 900;
}

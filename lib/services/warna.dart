import 'dart:math';
import 'package:flutter/material.dart';

class Warna{
  Color getColor() {
    var random = Random().nextInt(Colors.primaries.length - 1);
    return Colors.primaries[random];
  }
}
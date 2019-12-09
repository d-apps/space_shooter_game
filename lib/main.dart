
import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:space_shooter_game/game.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  Size size = await Flame.util.initialDimensions();
  await Flame.util.setPortrait();
  await Flame.util.fullScreen();

  runApp(SpaceShooterGame(size).widget);
}

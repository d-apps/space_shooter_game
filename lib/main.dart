
import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/flare_animation.dart';
import 'package:flame/game.dart';
import 'package:flame/time.dart';
import 'package:flame/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flame/animation.dart' as FlameAnimation;
import 'package:flame/spritesheet.dart';
import 'package:space_shooter_game/game.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  Size size = await Flame.util.initialDimensions();
  await Flame.util.setPortrait();
  await Flame.util.fullScreen();

  runApp(SpaceShooterGame(size).widget);
}

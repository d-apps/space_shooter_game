import 'package:flame/components/mixins/has_game_ref.dart';
import 'package:flame/components/text_component.dart';
import 'package:flame/text_config.dart';
import 'package:flutter/material.dart';
import 'package:space_shooter_game/game.dart';

class ScoreComponent extends TextComponent with HasGameRef<SpaceShooterGame>{

  ScoreComponent(): super(
    "Score 0",
    config: TextConfig(color: Colors.white)
  ){

    x = y = 5;

  }

  @override
  void update(double t) {

    super.update(t);
    text = "Score ${gameRef.score}";
  }

}
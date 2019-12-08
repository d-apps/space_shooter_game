import 'dart:ui';
import 'package:flame/components/timer_component.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/time.dart';
import 'package:flutter/material.dart';
import 'package:space_shooter_game/components/enemy_creator.dart';
import 'package:space_shooter_game/components/player_component.dart';
import 'package:space_shooter_game/components/score_component.dart';
import 'package:space_shooter_game/components/star_background_creator.dart';

class SpaceShooterGame extends BaseGame with PanDetector{

  PlayerComponent player;
  StarBackgroundCreator starBackGroundCreator;

  Size size;
  int score = 0;

  SpaceShooterGame(Size size){

    this.size = size;

    add(starBackGroundCreator = StarBackgroundCreator(size));
    starBackGroundCreator.init();

    add(ScoreComponent());


    _initPlayer();

    add(EnemyCreator());


  }

  void _initPlayer(){
    add(player = PlayerComponent());
  }


  @override
  void onPanStart(_) {
    player?.beginFire();
  }


  @override
  void onPanEnd(_) {
    player?.stopFire();
  }


  @override
  void onPanCancel() {
    player?.stopFire();
  }


  @override
  void onPanUpdate(DragUpdateDetails details) {
    player.move(details.delta.dx, details.delta.dy);
  }

  void increaseScore(){
    score++;
  }

  void playerTakeHit(){
    player.takeHit();
    player = null;
    score = 0;
    add(TimerComponent(Timer(
      1, callback: _initPlayer
        )..start()
      )
    );
  }

}
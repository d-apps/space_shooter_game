import 'dart:math';

import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/has_game_ref.dart';
import 'package:flame/sprite.dart';
import 'package:flame/spritesheet.dart';
import 'package:flame/time.dart';
import 'package:flutter/cupertino.dart';
import 'package:space_shooter_game/components/star_component.dart';
import 'package:space_shooter_game/game.dart';

class StarBackgroundCreator extends Component with HasGameRef<SpaceShooterGame> {

  static const star_speed = 10;
  final gapSize = 12;

  Timer starCreator;
  SpriteSheet starsSpriteSheet;
  Random random = Random();

  Size screesSize;

  StarBackgroundCreator(this.screesSize);

  void init(){
    starsSpriteSheet = SpriteSheet(
      imageName: "stars.png",
      textureHeight: 9,
      textureWidth: 9,
      rows: 4,
      columns: 4
    );

    final starGapTime = (screesSize.height / gapSize) / star_speed;

    starCreator = Timer(
      starGapTime,
      repeat: true,
      callback: (){
        _createRowOfStars(0);
      }
    )..start();

    _createInitialStars();

  }

  void _createStarAt(double x, double y){

    final animation = starsSpriteSheet.createAnimation(random.nextInt(3), to: 4)
        ..variableStepTimes = [
          max(20, 100 * random.nextDouble()),
          0.1,
          0.1,
          0.1,
        ];

    gameRef.add(StarComponent(x, y, animation));

  }

  _createRowOfStars(double y){
    final gapSize = 6;
    double starGap = screesSize.height / gapSize;

    for(var i =0; i < gapSize; i++){
       _createStarAt(
         starGap * i + (random.nextDouble() * starGap),
         y + (random.nextDouble() * 20)
       );
    }

  }

  void _createInitialStars(){
    double rows = screesSize.height / gapSize;

    for(var i = 0; i < gapSize; i++){
      _createRowOfStars(i * rows);
    }
  }

  @override
  void update(double dt) {
    starCreator.update(dt);
  }

  @override
  void render(Canvas c) {
    // TODO: implement render
  }

}
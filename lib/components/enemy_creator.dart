import 'dart:math';
import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/has_game_ref.dart';
import 'package:flame/time.dart';
import 'package:space_shooter_game/components/enemy_component.dart';
import 'package:space_shooter_game/game.dart';

class EnemyCreator extends Component with HasGameRef<SpaceShooterGame> {

  Timer enemyCreator;
  Random random = Random();

  EnemyCreator(){

    enemyCreator = Timer(1.0, repeat: true, callback: (){

      gameRef.add(EnemyComponent((gameRef.size.width - 25) * random.nextDouble(), 0));

    })..start();

  }

  @override
  void render(Canvas c) {
    // TODO: implement render
  }

  @override
  void update(double dt) {
    enemyCreator.update(dt);
  }

}
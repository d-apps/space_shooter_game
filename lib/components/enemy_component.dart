import 'package:flame/animation.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/components/mixins/has_game_ref.dart';
import 'package:space_shooter_game/components/explosion_component.dart';
import 'package:space_shooter_game/game.dart';

class EnemyComponent extends AnimationComponent with HasGameRef<SpaceShooterGame> {

  static const enemy_speed = 150;

  bool destroyed = false;

  EnemyComponent(double x, double y): super(25, 25, Animation.sequenced("enemy.png", 4, textureWidth: 16, textureHeight: 16)){
    this.x = x;
    this.y = y;
  }

  @override
  void update(double dt){
    y += enemy_speed * dt;

    if(gameRef.player != null && gameRef.player.toRect().overlaps(toRect())){
      takeHit();
      gameRef.playerTakeHit();
    }
  }

  void takeHit(){
    destroyed = true;

    gameRef.add(ExplosionComponent(x - 25, y - 25));
    gameRef.increaseScore();
  }

  @override
  bool destroy() => destroyed || y >= gameRef.size.height;

}
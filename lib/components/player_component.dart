import 'package:flame/animation.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/components/mixins/has_game_ref.dart';
import 'package:flame/time.dart';
import 'package:space_shooter_game/components/bullet_component.dart';
import 'package:space_shooter_game/components/explosion_component.dart';
import 'package:space_shooter_game/game.dart';

class PlayerComponent extends AnimationComponent with HasGameRef<SpaceShooterGame> {

  bool destroyed = false;
  Timer bulletCreator;

  PlayerComponent(): super(
    50, 75, Animation.sequenced("player.png", 4, textureWidth: 32, textureHeight: 48)){

    x = 100;
    y = 500;

    bulletCreator = Timer(0.5, repeat: true, callback: _createBullet);

  }

  void _createBullet(){
    gameRef.add(BulletComponent(x + 20, y + 20));
  }

  void beginFire(){
    bulletCreator.start();
  }

  void stopFire(){
    bulletCreator.stop();
  }

  void move(double deltaX, double deltaY){

    x += deltaX;
    y += deltaY;

  }

  @override
  void update(double dt) {
    super.update(dt);

    bulletCreator.update(dt);

  }

  void takeHit(){
    gameRef.add(ExplosionComponent(x, y));

    destroyed = true;
  }

  @override
  bool destroy() => destroyed;


}
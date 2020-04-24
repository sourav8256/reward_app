import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reward_game/flappybird/game/game.dart';
import 'package:flame/flame.dart';
import 'package:reward_game/flappybird/main.dart';

class Games extends StatefulWidget {
  @override
  _GamesState createState() => _GamesState();
}



class _GamesState extends State<Games> {

  FlutterBirdGame _flutterBirdGame;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFlutterBirdGame();
    Flame.util.addGestureRecognizer(new TapGestureRecognizer()
      ..onTapDown = (TapDownDetails evt) => this._flutterBirdGame.onTap());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _flutterBirdGame == null?Container() : _flutterBirdGame.widget,
    );


  }


  getFlutterBirdGame() async {
    WidgetsFlutterBinding.ensureInitialized();
    Flame.audio.disableLog();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setEnabledSystemUIOverlays([]);

    var sprite = await Flame.images.loadAll(["sprite.png"]);
    var screenSize = await Flame.util.initialDimensions();
    Singleton.instance.screenSize = screenSize;
    var flutterBirdGame = FlutterBirdGame(sprite[0], screenSize);
    this._flutterBirdGame = flutterBirdGame;
    setState(() {

    });
  }

}


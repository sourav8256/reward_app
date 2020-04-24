import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reward_game/flappybird/game/game.dart';
import 'package:reward_game/flappybird/main.dart';
import 'package:reward_game/screens/basic.dart';
import 'package:reward_game/screens/dashboard.dart';
import 'package:reward_game/screens/games.dart';
import 'package:reward_game/screens/login_screen.dart';
import 'package:reward_game/screens/login_screen_plain.dart';
import 'package:reward_game/screens/mobile_verification/otpinput.dart';
import 'package:reward_game/screens/mobile_verification/phonenumberinput.dart';
import 'package:reward_game/screens/navigation.dart';
import 'package:reward_game/screens/register_screen.dart';
import 'package:flame/flame.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  Flame.audio.disableLog();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIOverlays([]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {




  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreenPlain(),
    );
  }



}

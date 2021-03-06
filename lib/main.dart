import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dice_game/dice_game.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: DiceGame()
    );
  }
}


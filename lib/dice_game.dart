import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiceGame extends StatefulWidget {

  @override
  _DiceGameState createState() => _DiceGameState();
}

class _DiceGameState extends State<DiceGame> {
  var random = Random.secure();
  var dices= const <String> [
    'images/d1.png',
    'images/d2.png',
    'images/d3.png',
    'images/d4.png',
    'images/d5.png',
    'images/d6.png',
  ];
  var index=0;
  var score1=0;
  var score2=0;
  var highest_score=0;
  var index1=0;
  var index2=0;
  var bool1=false;
  var bool3=false;
  var bool4=false;
  var bool2=true;
  var bool5=false;
  var bool6=false;

  void _changeDice(){
    setState(() {
      index1 = random.nextInt(6);
      index2 = random.nextInt(6);
      score1 =index1+index2+2;
      score2 +=score1;
      if(score2>highest_score){
        highest_score=score2;

      }
      if(score1==7)
      {bool3=false; bool5=true;
      if(score2==highest_score){
        bool6=true;
      }}

    });

    print(index);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Dice Game')
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            if(bool5)Column(
              children: [
                Text('Game Over',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold, color: Colors.red))
              ],
            ),
            if(bool4)Column(
              children: [
                Text('Your Score: $score2',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                Text('Highest Score: $highest_score',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.deepPurple),),
              ],
            ),
            if(bool6)Column(
              children: [
                Text('Congratulations, You got Highest Score',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.red))
              ],),


            SizedBox(height: 30,),
            if(bool4)Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                Image.asset(dices[index1],fit: BoxFit.cover,width: 130,height: 130,),
                Image.asset(dices[index2],fit: BoxFit.cover,width: 130,height: 130,),
              ],
            ),
            SizedBox(height: 30,),
            if(bool3)ElevatedButton(onPressed: _changeDice, child: Text("Roll"),style: ElevatedButton.styleFrom(
              primary: Colors.deepPurple,
              shadowColor: Colors.black,
              shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            ),),
            if(bool1)ElevatedButton(onPressed: (){
              setState(() {
                bool3=true;
                bool4=true;
                bool1=false;
              });
            }, child: Text("Start")),
            if(bool2)ElevatedButton(onPressed: (){
              setState(() {
                bool1=true;
                bool2=false;
              });

            }, child: Text("Lets Play"),style: ElevatedButton.styleFrom(
              primary: Colors.green,
              shadowColor: Colors.black,
              shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            ),),
            if(bool5)ElevatedButton(onPressed: (){
              setState(() {
                bool2=true;
                bool5=false;
                bool4=false;
                bool6=false;
                score2=0;
              });

            }, child: Text("Play Again"),style: ElevatedButton.styleFrom(
              primary: Colors.red,
              shadowColor: Colors.black,
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            ),)

          ],
        ),
      ),

    );
  }
}

import 'dart:math';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index =1;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()=>_onBackPressed(),
      child: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          title: Text('Dice Roller App',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Container(
                    width: 120,
                    height: 120,
                    child: Image.asset('assets/images/dice_$index.png'),
                  ),
                  onTap: (){
                    setState((){
                      AssetsAudioPlayer.newPlayer().open(
                        Audio("assets/sounds/sound.mp3"),
                        autoStart: true,
                        showNotification: true,
                      );
                      Random random = new Random();
                      index = random.nextInt(6)+1;
                    });
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


  Future<bool> _onBackPressed() async{
    bool? exitapp =await showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('Exit ?'),
            content:Text('Are You Sure You Want To Exit?'),
            actions: [
              TextButton(onPressed: (){
                Navigator.of(context).pop(true);
              }, child: Text('Yes',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.black))),
              TextButton(onPressed: (){
                Navigator.of(context).pop(false);
              }, child: Text('No',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.black))),
            ],
          );
        });
    return exitapp??false;
  }

}

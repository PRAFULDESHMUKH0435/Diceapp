import 'dart:math';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index =1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Dice Roller App',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
        actions: [
          InkWell(
            onTap: (){
              _launchURL('https://pub.dev/');
            },
            child: Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: CircleAvatar(
                radius: 18,
                child: Image.network('https://cdn-icons-png.flaticon.com/512/25/25231.png'),
              ),
            ),
          )
        ],
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
    );
  }


  Future<void> _launchURL(String url) async {
    final Uri uri = Uri(scheme: "https", host: url);
    if (!await launchUrl(uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Can not launch url";
    }
  }

}

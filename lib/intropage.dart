import 'package:diceapp/IntroScreens/page1.dart';
import 'package:diceapp/IntroScreens/page2.dart';
import 'package:diceapp/IntroScreens/page3.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'homepage.dart';

class IntroPage extends StatefulWidget {
  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  PageController _controller = PageController();
  bool islastpage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: _controller,
              onPageChanged: (index){
                setState(() {
                    islastpage=(index==2);
                });
                print(islastpage);
              },
              children: [
                Page1(),
                Page2(),
                Page3()
              ],
            ),
            Container(
              alignment: Alignment(0,0.85),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                      onTap:(){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
                      },
                      child: Text('Skip',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
                  SmoothPageIndicator(controller: _controller, count: 3,),
                  islastpage?
                  InkWell(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
                      },
                      child: Text('Done',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                  ):InkWell(
                      onTap: (){
                        _controller.nextPage(duration: Duration(seconds: 1), curve: Curves.easeIn);
                      },
                      child: Text('Next',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                  ),
                ],
              )
            )
          ],
        ),
    );
  }
}

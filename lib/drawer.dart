import 'package:flutter/material.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.yellow,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              child: Text('Navigation Drawer',style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
            ),
          )
        ],
      ),
    );
  }
}

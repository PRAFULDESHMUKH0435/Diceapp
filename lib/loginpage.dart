import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              MyField('UserName','Enter UserName',Icon(Icons.person_2_outlined)),
              MyField('Password','Enter Password',Icon(Icons.password)),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 40.0),
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){}, child: Text('Submit',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),))),
              Container(
                  margin: EdgeInsets.only(right: 20.0,top: 10.0),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Dont Have an Account ?',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      Text('Create One',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                    ],
                  )),
              Container(
                margin: EdgeInsets.only(right: 20.0,top: 10.0,bottom: 10.0),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Forgot Password',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                    ],
                  )),
            ]
          ),
        ),
      )
    );
  }
  
  Widget MyField(String str,String str1, Icon micon){
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: Colors.white,width: 2.0)
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: Colors.purpleAccent)
          ),
          prefixIcon: Icon(micon.icon,color: Colors.white,),
          label:Text(str),
          hintText: str1,
          filled: true
        ),
      ),
    );
  }
}



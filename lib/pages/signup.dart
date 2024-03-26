import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 200, horizontal: 30),
          child: Column(
            children: [
              Text("hellooo signup page"),
              IconButton(onPressed: (){
                 Navigator.pushNamed(context, '/home');
              }, icon: Icon(Icons.arrow_back_ios_rounded))
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
              child: Container(
            padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 180,
                  
                  child: Image.asset("asset/images/login.gif")),
                Text(
                  "Login",
                  style: TextStyle(
                    fontFamily: "Gilroy",
                    fontSize: 70,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CupertinoTextField.borderless(
                  style: TextStyle(color: Colors.white),
                  padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                  placeholder: "Enter Username",
                  placeholderStyle: TextStyle(
                      color: Color.fromARGB(255, 194, 191, 191), fontSize: 20),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 21, 20, 20),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CupertinoTextField.borderless(
                  obscureText: true,
                  style: TextStyle(color: Colors.white),
                  padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                  placeholder: "Enter Password",
                  placeholderStyle: TextStyle(
                      color: Color.fromARGB(255, 194, 191, 191), fontSize: 20),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 21, 20, 20),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 180,
                  child: CupertinoButton.filled(
                    
                      child: Text("Login", style: TextStyle(
                        fontFamily: "Gilroy",
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      ),),
                  
                      onPressed: () => {Navigator.pushNamed(context, '/home')}),
                )
              ],
            ),
          ))),
    );
  }
}

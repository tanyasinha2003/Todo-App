import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/model/todo.dart';
import 'package:to_do_app/pages/addTask.dart';
import 'package:to_do_app/pages/home.dart';

import 'package:to_do_app/pages/login.dart';
import 'package:to_do_app/pages/signup.dart';
import 'package:to_do_app/provider/taskProvider.dart';

void main() {
  runApp(
   MyApp()
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  // final todoList = ToDo.todoList();

  

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create:(_)=> TaskProvider())],
      child: CupertinoApp(
          debugShowCheckedModeBanner: false,
          home: Login(),
          routes: {
            '/login': (context) => Login(),
            '/signup': (context) => Signup(),
            "/home": (context) => Home(),
            '/addTask': (context) => AddTask(),
          } ),
    );
  }
}


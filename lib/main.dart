import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/model/todo.dart';
import 'package:to_do_app/pages/addTask.dart';

import 'package:to_do_app/pages/login.dart';
import 'package:to_do_app/pages/signup.dart';

void main() {
  runApp(
    CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
      routes: {
        '/login': (context) => Login(),
        '/signup': (context) => Signup(),
        "/home": (context) => MyApp(),
        '/addTask':(context) => AddTask(),
      },
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final todoList = ToDo.todoList();

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.black,
          body: Container(
            padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Your Tasks",
                  style: TextStyle(
                    fontFamily: "Gilroy",
                    fontSize: 50,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ToDoItem(),
                ToDoItem()
              ],
            ),
          ),
          bottomNavigationBar: CurvedNavigationBar(
            animationDuration: Duration(milliseconds: 300),
            backgroundColor: Colors.black,
            height: 80,
            items: [
              CurvedNavigationBarItem(
                  child: Icon(
                Icons.account_circle,
                color: Colors.black,
              )),
               CurvedNavigationBarItem(
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
                label: "Add Task",
                labelStyle: TextStyle(fontSize: 15),
              ),
              CurvedNavigationBarItem(
                  child: Icon(
                Icons.search_rounded,
                color: Colors.black,
              )),
            ],
            onTap: (index) {
              _currentIndex = index;
              if (index == 0) {
                Navigator.pushNamed(context, '/login');
              }
              else if(index == 1) {
                Navigator.pushNamed(context, '/addTask');
              }
            },
          ),
        ));
  }
}

class ToDoItem extends StatefulWidget {
  @override
  State<ToDoItem> createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem> {
  bool? _isChecked = false;

//   final ToDo item ;

//  _ToDoItemState({Key? key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: CheckboxListTile(
        title: Text(
          "Complete todo app",
          textAlign: TextAlign.left,
          style: _isChecked == false
              ? TextStyle(
                  color: Colors.white,
                  fontFamily: "Gilroy",
                  fontSize: 18,
                  decoration: TextDecoration.none)
              : TextStyle(
                  color: const Color.fromARGB(255, 194, 191, 191),
                  fontFamily: "Gilroy",
                  fontSize: 18,
                  decoration: TextDecoration.lineThrough,
                  decorationThickness: 2,
                  decorationColor: const Color.fromARGB(255, 21, 20, 20),
                ),
        ),
        controlAffinity: ListTileControlAffinity.leading,
        value: _isChecked,
        onChanged: (bool? newVal) {
          setState(() {
            _isChecked = newVal;
          });
        },
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        activeColor: Colors.green,
        tileColor: Color.fromARGB(255, 21, 20, 20),
        checkColor: Colors.black,
        checkboxShape: CircleBorder(),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        secondary: Container(
          height: 40,
          width: 40,
          margin: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: IconButton(
            color: Color.fromARGB(255, 247, 112, 102),
            iconSize: 20,
            icon: Icon(Icons.delete),
            onPressed: () {
              print("delete this task");
            },
          ),
        ),
      ),
    );
  }
}

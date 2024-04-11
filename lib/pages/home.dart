import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/components/toDoItem.dart';
import 'package:to_do_app/model/todo.dart';
import 'package:to_do_app/provider/taskProvider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    List<ToDo> taskList = Provider.of<TaskProvider>(context).list;

    return Scaffold(
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
            ListView.builder(
              shrinkWrap: true,
              itemCount: taskList.length,
              itemBuilder: ((context, index) {
              return ToDoItem(task: taskList[index]);
            }))
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
          } else if (index == 1) {
            Navigator.pushNamed(context, '/addTask');
          }
        },
      ),
    );
  }
}

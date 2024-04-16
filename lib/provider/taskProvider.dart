import 'package:flutter/material.dart';
import 'package:to_do_app/model/todo.dart';

class TaskProvider extends ChangeNotifier {

  List<ToDo> taskList = [];

  List<ToDo> get list=> taskList;

  void addNewTask(ToDo todo){
    taskList.add(todo);
    notifyListeners();
  }

  void deleteTask(ToDo todo){
    taskList.remove(todo);
    notifyListeners();
  }

}

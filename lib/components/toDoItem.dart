import 'package:flutter/material.dart';
import 'package:to_do_app/model/todo.dart';

class ToDoItem extends StatefulWidget {
  final ToDo task;

  const ToDoItem({Key? key, required this.task}) : super(key: key);

  @override
  State<ToDoItem> createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem> {
  bool? _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: CheckboxListTile(
        title: Text(
          widget.task.title,
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
        subtitle: Text(
          widget.task.note,
          style: _isChecked == false
              ? TextStyle(color: Colors.white)
              : TextStyle(
                  color: const Color.fromARGB(255, 194, 191, 191),
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

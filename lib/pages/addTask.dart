import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/model/quotes.dart';
import 'package:to_do_app/model/todo.dart';
import 'package:to_do_app/model/user.dart';
import 'package:to_do_app/provider/taskProvider.dart';

class AddTask extends StatefulWidget {
  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  var formKey = GlobalKey<FormState>();
  String? selectedDateError;

  User newUser = new User();

  ToDo task= new ToDo();

  //year,month,day,hour,min
  DateTime dateTime = new DateTime(2000);

  bool switchValue = false;

  // bool addQuotes = false;

  Quotes? quote;

  String? _validateDate(DateTime date) {
    final currentDate = DateTime.now();
    if (date.isBefore(currentDate)) {
      return "Selected date cannot be in the past";
    }
    return null;
  }

  Future<Quotes> getQuotes() async {
    Quotes quotes = new Quotes();
    return await quotes.fromJSON();
  }

  Future<void> fetchQuote() async {
    try {
      // Fetch quote
      quote = await getQuotes();
      // Update the UI
      setState(() {
        task.quote = quote;
      });
    } catch (e) {
      print("Error fetching quote: $e");
      // Handle error if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context,listen: false);
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.black,
          body: Container(
            padding: const EdgeInsets.symmetric(vertical: 80),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      
                      children: [
                        Text(
                          "Add Task",
                          style: TextStyle(
                            fontFamily: "Gilroy",
                            fontSize: 50,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CupertinoFormSection.insetGrouped(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 21, 20, 20),
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.black,
                      header: Text(
                        "Task",
                        style: TextStyle(
                            color: Color.fromARGB(255, 194, 191, 191),
                            fontFamily: "Gilroy",
                            fontSize: 16),
                      ),
                      children: [
                        CupertinoFormRow(
                          prefix: Text(
                            "Title",
                            style: TextStyle(color: Colors.white),
                          ),
                          child: CupertinoTextFormFieldRow(
                              style: TextStyle(color: Colors.white),
                              placeholder: 'Enter Title',
                              placeholderStyle: TextStyle(
                                  color: Color.fromARGB(255, 129, 126, 126)),
                              onChanged: (value) => {task.title=value},
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              textInputAction: TextInputAction.next,
                              validator: (title) =>
                                  title == null || title=="" ? 'Title is required' : null),
                              
                        ),
                        CupertinoFormRow(
                          prefix: Text(
                            "Note",
                            style: TextStyle(color: Colors.white),
                          ),
                          child: CupertinoTextFormFieldRow(
                            style: TextStyle(color: Colors.white),
                            placeholder: 'Add Note',
                            placeholderStyle: TextStyle(
                                color: Color.fromARGB(255, 129, 126, 126)),
                                onChanged: (value) => {task.note=value},
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            textInputAction: TextInputAction.next,
                          ),
                        ),

                        //add the date thing here
                        CupertinoFormRow(
                            prefix: Text(
                              "Date of Completion",
                              style: TextStyle(color: Colors.white),
                            ),
                            child: Container(
                              child: CupertinoButton(
                                child: Text(
                                  "${dateTime.day}/${dateTime.month}/${dateTime.year}",
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 129, 126, 126)),
                                ),
                                onPressed: () {
                                  showCupertinoModalPopup(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          SizedBox(
                                            width: double.infinity,
                                            height: 250,
                                            child: CupertinoTheme(
                                              data: CupertinoThemeData(
                                                  textTheme:
                                                      CupertinoTextThemeData(
                                                          dateTimePickerTextStyle:
                                                              TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      20))),
                                              child: CupertinoDatePicker(
                                                backgroundColor: Color.fromARGB(
                                                    255, 21, 20, 20),
                                                initialDateTime: dateTime,
                                                onDateTimeChanged:
                                                    (DateTime newDateTime) {
                                                  setState(() {
                                                        dateTime = newDateTime;
                                                        task.dateOfCompletion = dateTime;
                                                  }   
                                                      );
                                                  selectedDateError =
                                                      _validateDate(
                                                          newDateTime);
                                                },
                                                mode: CupertinoDatePickerMode
                                                    .date,
                                              ),
                                            ),
                                          ));
                                },
                              ),
                            )),
                        if (selectedDateError != null)
                          Text(
                            selectedDateError!,
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                            ),
                          ),
                        SizedBox(height: 5)
                      ]),
                  CupertinoFormSection.insetGrouped(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 21, 20, 20),
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.black,
                      header: Text("Quote",
                          style: TextStyle(
                              color: Color.fromARGB(255, 194, 191, 191),
                              fontFamily: "Gilroy",
                              fontSize: 16)),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: CupertinoFormRow(
                              helper: Text("Toggle switch to change quote",style: TextStyle(color: Color.fromARGB(255, 129, 126, 126),fontSize: 15),),
                              prefix: Text(
                                "Add Quote",
                                style: TextStyle(color: Colors.white),
                              ),
                              child: CupertinoSwitch(
                                  value: switchValue,
                                  onChanged: (value) {
                                    //add logic for getting the quote
                                    setState(() {
                                      switchValue = value;
                                      if (value == true) {
                                        fetchQuote();
                                      }
                                    });
                                  })),
                        ),
                        if (quote != null && switchValue == true)
                          
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              children: [
                                Padding( 
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Text(quote!.quote!,
                                      style: TextStyle(color: Colors.white)),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Text("-" + quote!.author!,
                                          style: TextStyle(
                                            color: Colors.white,
                                          )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                      ]),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 390,
                    child: CupertinoButton.filled(
                        child: Text("Create Task"),
                        onPressed: () {
                          final form = formKey.currentState!;
                          
                          if (form.validate() && selectedDateError == null) {
                            taskProvider.addNewTask(task);
                            Navigator.pushNamed(context, '/home');
                          }
                        }),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

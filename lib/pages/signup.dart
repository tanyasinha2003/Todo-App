import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  var formKey = GlobalKey<FormState>();

  //year,month,day,hour,min
  DateTime dateTime = new DateTime(2000, 1, 1, 10, 20);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: Scaffold(
          backgroundColor: Colors.black,
          body: Container(
            padding: const EdgeInsets.symmetric(vertical: 80),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Text(
                    "Create account",
                    style: TextStyle(
                      fontFamily: "Gilroy",
                      fontSize: 50,
                      color: Colors.white,
                    ),
                  ),
                  CupertinoFormSection.insetGrouped(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 21, 20, 20),
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.black,
                      header: Text(
                        "Account",
                        style: TextStyle(
                            color: Color.fromARGB(255, 194, 191, 191),
                            fontFamily: "Gilroy",
                            fontSize: 16),
                      ),
                      children: [
                        CupertinoFormRow(
                          prefix: Text(
                            "Email",
                            style: TextStyle(color: Colors.white),
                          ),
                          child: CupertinoTextFormFieldRow(
                              style: TextStyle(color: Colors.white),
                              placeholder: 'Enter Email',
                              placeholderStyle: TextStyle(
                                  color: Color.fromARGB(255, 129, 126, 126)),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              textInputAction: TextInputAction.next,
                              validator: (email) => email != null &&
                                      !EmailValidator.validate(email)
                                  ? 'Enter valid email'
                                  : null),
                        ),
                        CupertinoFormRow(
                          prefix: Text(
                            "Password",
                            style: TextStyle(color: Colors.white),
                          ),
                          child: CupertinoTextFormFieldRow(
                            obscureText: true,
                            style: TextStyle(color: Colors.white),
                            placeholder: 'Enter Password',
                            placeholderStyle: TextStyle(
                                color: Color.fromARGB(255, 129, 126, 126)),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            textInputAction: TextInputAction.next,
                            validator: (password) {
                              if (password == null || password.isEmpty) {
                                return "Enter Valid Password";
                              } else if (password.length < 8) {
                                return "Must be at least 8 characters";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                      ]),
                  CupertinoFormSection.insetGrouped(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 21, 20, 20),
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.black,
                      header: Text("Details",
                          style: TextStyle(
                              color: Color.fromARGB(255, 194, 191, 191),
                              fontFamily: "Gilroy",
                              fontSize: 16)),
                      children: [
                        CupertinoFormRow(
                          prefix: Text(
                            "Name",
                            style: TextStyle(color: Colors.white),
                          ),
                          child: CupertinoTextFormFieldRow(
                            style: TextStyle(color: Colors.white),
                            placeholder: 'Enter Name',
                            placeholderStyle: TextStyle(
                                color: Color.fromARGB(255, 129, 126, 126)),
                            textInputAction: TextInputAction.next,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (name) {
                              if (name == null || name.isEmpty) {
                                return "Name is required";
                              }
                            },
                          ),
                        ),
                        CupertinoFormRow(
                          prefix: Text(
                            "Username",
                            style: TextStyle(color: Colors.white),
                          ),
                          child: CupertinoTextFormFieldRow(
                            style: TextStyle(color: Colors.white),
                            placeholder: 'Enter Username',
                            placeholderStyle: TextStyle(
                                color: Color.fromARGB(255, 129, 126, 126)),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (name) {
                              if (name == null || name.isEmpty) {
                                return "Username is required";
                              }
                            },
                          ),
                        ),
                        CupertinoFormRow(
                            prefix: Text(
                              "DOB",
                              style: TextStyle(color: Colors.white),
                            ),
                            child: Container(
                              child: CupertinoButton(
                                child: Text("Select DOB"),
                                onPressed: () {
                                  showCupertinoModalPopup(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          SizedBox(
                                            width: 600,
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
                                                  setState(() =>
                                                      dateTime = newDateTime);
                                                },
                                                mode: CupertinoDatePickerMode
                                                    .date,
                                              ),
                                            ),
                                          ));
                                },
                              ),
                            ))
                      ]),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 390,
                    child: CupertinoButton.filled(
                        child: Text("Register"),
                        onPressed: () {
                          final form = formKey.currentState!;

                          if (form.validate()) {
                            print("Form is valid");

                            final snackBar = SnackBar(
                                content: Text("Account created successfully"));

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        }),
                  )
                ],
              ),
            ),
          )),
    );
  }
}

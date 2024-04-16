import 'package:to_do_app/model/quotes.dart';

class ToDo {
  String? id;
  String title="";
  String note="";
  bool? isDone=false;
  Quotes? quote;
  DateTime dateOfCompletion= DateTime.now();

  @override
  String toString() {
    // TODO: implement toString
    
    print("$id + $title + $note + $isDone+ $dateOfCompletion+ $quote");
   
    return super.toString();
  }
}

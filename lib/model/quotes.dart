import 'package:to_do_app/api/http_helper.dart';

class Quotes{
  String? quote;
  String? author;
  Quotes({this.quote,this.author});

   Future<Quotes> fromJSON() async {
    HttpHelper httpHelper = HttpHelper("https://zenquotes.io/api/");
    
    List<dynamic> responseData = await httpHelper.getData("random");
   
    return Quotes(
      quote: responseData[0]['q'], 
      author: responseData[0]['a'], 
    );
  }
}

 void main() async{
      Quotes quotes = Quotes();
  // Call the fromJSON method to fetch data
  Quotes result = await quotes.fromJSON();
  // Print the result
  print("Quote: ${result.quote}");
  print("Author: ${result.author}");
  }
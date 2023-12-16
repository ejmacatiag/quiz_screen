import 'package:http/http.dart' as http; // the http package
import './question_model.dart';
import 'dart:convert';

class DBconnect {

  final url = Uri.parse(
      'https://arpha-d4a14-default-rtdb.firebaseio.com/questions.json');


  Future<List<Question>> fetchQuestions() async {
  
    return http.get(url).then((response) {

      var data = json.decode(response.body) as Map<String, dynamic>;
      List<Question> newQuestions = [];
      data.forEach((key, value) {
        var newQuestion = Question(
          id: key, // the encrypted key/the title we gave to our data
          title: value['title'], // title of the question
          option: Map.castFrom(value['option']), // options of the question
        );
        newQuestions.add(newQuestion);
      });
      return newQuestions;
    });
  }
}

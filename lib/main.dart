import 'package:flutter/material.dart';
import 'package:quizzler/QuestionBrain.dart';

QuestionBrain questionBrain = QuestionBrain();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //: Colors.black,
      //color: Colors.black,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Center(
            child: Text('Quizzler'),
          ),
        ),
        body: Quiz(),
      ),
    );
  }
}

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<Icon> Ico = [
    // const Icon(
    //   Icons.check,
    //   color: Colors.green,
    //   size: 24.0,
    // ),
  ];
  List<String> questions = ['Q1', 'Q2', 'Q3'];
  int qNumber = 0;
  List<bool> answer = [true, false, true];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  questionBrain.getQuestion(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    checkAnswer(true);
                  });
                },
                child: const Text(
                  'True',
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.all(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    checkAnswer(false);
                  });
                },
                child: const Text(
                  'False',
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.all(10),
                ),
              ),
            ),
          ),
          Row(
            children: Ico,
          )
          //TODO:Just add rows
        ],
      ),
    );
  }

  bool isReachedEnd = false;
  void checkAnswer(bool ans) {
    if (questionBrain.hasNextQuestion()) {
      if (questionBrain.getQuestionAnswer() == ans) {
        Ico.add(const Icon(
          Icons.check,
          color: Colors.green,
          size: 24.0,
        ));
      } else {
        Ico.add(const Icon(
          Icons.close,
          color: Colors.red,
          size: 24.0,
        ));
      }
      questionBrain.nextQuestion();
    }
  }
}

import 'package:flutter/material.dart';
import 'package:questions_app/questions.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(83, 109, 254, 150),
        title: const Padding(
          padding: EdgeInsets.only(left: 100),
          child: Text(
            "Questions",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: QuestionsPage(),
      ),
    ));
  }
}

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({Key? key}) : super(key: key);

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

Questions questions = Questions();

class _QuestionsPageState extends State<QuestionsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: questions.answersResult,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40, bottom: 50),
          child: Expanded(
              flex: 4,
              child: Column(
                children: [
                  Image.asset(questions.getImage()),
                  const SizedBox(height: 20),
                  Text(
                    questions.getQuestion(),
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: SizedBox(
            width: 350,
            child: TextButton(
              onPressed: () {
                questions.appuieSurButton(true);
                setState(() {
                  if (!questions.checkQuestion()) {
                    questions.incrementQuestion();
                  } else {
                    Alert(
                      context: context,
                      type: AlertType.error,
                      title: "End of the questions",
                      desc: "You have answered all the questions",
                      buttons: [
                        DialogButton(
                          child: Text(
                            "Try again",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () => Navigator.pop(context),
                          width: 120,
                        )
                      ],
                    ).show();
                    questions.questionsNumber = 0;
                    questions.answersResult.clear();
                  }
                });
              },
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromRGBO(26, 35, 126, 10),
                primary: Colors.white,
                side: const BorderSide(
                    color: Color.fromRGBO(213, 0, 0, 10), width: 2),
              ),
              child: const Text(
                "True",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: SizedBox(
            width: 350,
            child: TextButton(
              onPressed: () {
                questions.appuieSurButton(false);
                setState(() {
                  if (!questions.checkQuestion()) {
                    questions.incrementQuestion();
                  } else {
                    Alert(
                      context: context,
                      type: AlertType.error,
                      title: "End of the questions",
                      desc: "You have answered all the  questions",
                      buttons: [
                        DialogButton(
                          child: Text(
                            "Try again",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () => Navigator.pop(context),
                          width: 120,
                        )
                      ],
                    ).show();
                    questions.questionsNumber = 0;
                    questions.answersResult.clear();
                  }
                });
              },
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromRGBO(213, 0, 0, 10),
                primary: Colors.white,
                side: const BorderSide(
                    color: Color.fromRGBO(26, 35, 126, 10), width: 2),
              ),
              child: const Text(
                "False",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

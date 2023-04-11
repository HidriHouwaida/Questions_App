import 'package:flutter/material.dart';

class Questions {
  //Les attributs
  int questionsNumber = 0;
  int rightanswers=0;
  final List<String> _questionsImage = [
    "images/image1.jpg",
    "images/image2.jpg",
    "images/image3.jpg",
    "images/image4.png",
    "images/image5.jpg"
  ];
  final List<String> _questions = [
    "The atomic number for lithium is 17",
    " A cross between a horse and a zebra is called a 'Hobra'",
    "The black box in a plane is black",
    "Alliumphobia is a fear of garlic",
    "Marrakesh is the capital of Morocco",
  ];
  final List<bool> _answers = [false, false, false, true, false];
  List<Padding> answersResult = [];
  List<bool> getAnswers() {
    return _answers;
  }

  List<String> getQuestions() {
    return _questions;
  }

  void appuieSurButton(bool answer) {
    if (getAnswers()[questionsNumber] == answer) {
      rightanswers++;
      answersResult.add(const Padding(
        padding: EdgeInsets.all(5),
        child: Icon(
          Icons.thumb_up,
          color: Colors.green,
        ),
      ));
    } else if (getAnswers()[questionsNumber] == !answer) {
      answersResult.add(const Padding(
        padding: EdgeInsets.all(5),
        child: Icon(
          Icons.thumb_down,
          color: Colors.red,
        ),
      ));
    }
  }

  void incrementQuestion() {
    if (questionsNumber < getQuestions().length - 1) {
      questionsNumber++;
    }
  }

  String getImage() {
    return _questionsImage[questionsNumber];
  }

  String getQuestion() {
    return getQuestions()[questionsNumber];
  }

  bool checkQuestion() {
    return questionsNumber >= getQuestions().length - 1;
  }

  void reset() {
    questionsNumber = 0;
    answersResult.clear();
  }


}

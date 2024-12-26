import 'questions.dart';

class QuizBrain {
  int _questionNumber = 0;

  final  List<Questions> _questionBlank = [
    Questions('Some cats are actually allergic to humans', true),
    Questions('You can lead a cow down stairs but not up stairs', true),
    Questions('A slug\'s blood is green', true),
    Questions('It\'s illegal to pee in the Ocean in Portugal', true),
    Questions('No piece of square dry paper can be folded in half more than 7 times', false),
    Questions('In London if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place', true),
    Questions('The total surface area of two human lungs is approximately 70 square metres', true),
    Questions('Google was originally called \'Backrup\'.', true),
  ];

  String getText() {
    return _questionBlank[_questionNumber].questionText;
  }

  bool getAnswer() {
    return _questionBlank[_questionNumber].questionAnswer;
  }

  void nextQuestion() {
    if (_questionNumber < _questionBlank.length - 1)  {
      _questionNumber++;
    }
  }

  bool isFinished() {
    if(_questionNumber >= _questionBlank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }

}

import 'package:flutter/material.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();


void main() => runApp(const Quiz());


class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Scelet(),
        backgroundColor: Colors.white,
      ),
    );
  }
}

class Scelet extends StatefulWidget {
  const Scelet({super.key});


  @override
  State<Scelet> createState() => _SceletState();
}

class _SceletState extends State<Scelet> {

 List <Icon> scoreKeeper = [];

 void checkAnswer(bool userpickedAnswer) {

   bool correctAnswer = quizBrain.getAnswer();

   setState(() {

     if(quizBrain.isFinished() == true) {

       showDialog(
           context: context,
           builder: (context) => AlertDialog(
             title: Text('Finished', textAlign: TextAlign.center,),
             content: Text('You reached the last question. Tap to finish to start from first question.', textAlign: TextAlign.center,),
             actions: [
               TextButton(onPressed: (){
                 Navigator.pop(context);
               }, child: Text('Cancel',))
             ],
           )
       );

       quizBrain.reset();

       scoreKeeper = [];

     } else {
       if(correctAnswer == userpickedAnswer) {
         scoreKeeper.add(const Icon(Icons.check, color: Colors.green,));
       } else {
         scoreKeeper.add(const Icon(Icons.remove, color: Colors.red,));
       }

       quizBrain.nextQuestion();
     }

   });
 }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 12,
            child: Center(
                child: Text(
                    quizBrain.getText(),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500,),
            )),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () {
                checkAnswer(true);
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              child: const Text(
                'True',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () {
                checkAnswer(false);
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
              child: const Text(
                'False',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    color: Colors.white),
              ),
            ),
          ),
          Row(children: scoreKeeper)
        ],
      ),
    ));
  }
}

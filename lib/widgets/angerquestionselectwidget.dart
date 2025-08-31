import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';
import 'package:peacecarrots/widgets/carrotdisplaywidget.dart';
import 'package:peacecarrots/widgets/custombutton1.dart';
import 'package:provider/provider.dart';
import '../data/database.dart';
import '../providers/dataprovider.dart';
import '../utils/utils.dart';

class AngerQuestionSelect extends StatefulWidget {
  const AngerQuestionSelect({super.key});

  @override
  State<AngerQuestionSelect> createState() => _AngerQuestionSelectState();
}

class _AngerQuestionSelectState extends State<AngerQuestionSelect> {
  bool _surveyComplete = false;
  Carrot? _newCarrot = null;

  Map<String, dynamic> angerSpectrumQuiz = {
    'title': 'The Anger Spectrum Quiz',
    'description': 'Find out what type of anger you most commonly feel.',
    'questions': [
      {
        'questionText': 'When someone irritates you, how do you most often react?',
        'options': {
          'A': 'I get a sudden burst of energy, my face feels hot, and I might raise my voice.',
          'B': 'I start feeling on edge and antsy, and I might fidget or pace.',
          'C': 'I get a strong sense of impatience and annoyance, often muttering to myself.',
          'D': 'I feel a wave of resentment, thinking about how unfair the situation is.',
          'E': 'I become very quiet and cold, trying to distance myself from the person.',
          'F': 'I feel a deep sense of indignation, believing the person is in the wrong.',
          'G': 'I feel a sense of superiority, as if their actions are beneath me.',
        },
        'answer' : null,
        'scores': {
          'A': 0,
          'B': 0,
          'C': 0,
          'D': 0,
          'E': 0,
          'F': 0,
          'G': 0,
        },
      },
      {
        'questionText': 'Imagine a situation where you feel you\'ve been betrayed. Which feeling dominates?',
        'options': {
          'A': 'A furious rage, where I want to confront the person immediately.',
          'B': 'A restless agitation, where I can\'t stop replaying the event in my mind.',
          'C': 'A powerful sense of frustration that a trusted relationship is not working.',
          'D': 'A bitter envy, thinking about what they might have and you don\'t.',
          'E': 'A deep sense of hurt and emotional withdrawal, where I close myself off.',
          'F': 'A profound disappointment and a feeling of righteous anger.',
          'G': 'A cold contempt for the person\'s character and lack of morals.',
        },
        'answer' : null,
        'scores': {
          'A': 0,
          'B': 0,
          'C': 0,
          'D': 0,
          'E': 0,
          'F': 0,
          'G': 0,
        },
      },
      {
        'questionText': 'How do you handle a minor inconvenience, like being stuck in traffic or a slow line?',
        'options': {
          'A': 'I feel an immediate surge of rage, honking my horn or complaining loudly.',
          'B': 'I get increasingly restless and agitated, feeling like I can\'t sit still.',
          'C': 'I feel a sharp pang of frustration and impatience.',
          'D': 'I feel a simmering resentment that others are getting ahead of me.',
          'E': 'I become quiet and withdrawn, feeling annoyed but keeping it to myself.',
          'F': 'I feel a deep sense of injustice, believing the system is rigged against me.',
          'G': 'I feel a sense of condescension towards those around me for their lack of foresight.',
        },
        'answer' : null,
        'scores': {
          'A': 0,
          'B': 0,
          'C': 0,
          'D': 0,
          'E': 0,
          'F': 0,
          'G': 0,
        },
      },
      {
        'questionText': 'When you\'re angry, what do your friends or family most often notice about you?',
        'options': {
          'A': 'That I\'ve "blown up" or "lost it."',
          'B': 'That I\'m easily agitated and difficult to be around.',
          'C': 'That I\'m visibly annoyed or frustrated.',
          'D': 'That I seem bitter or resentful about something.',
          'E': 'That I\'ve gone silent and am giving them the cold shoulder.',
          'F': 'That I\'m deeply hurt and feel wronged.',
          'G': 'That I\'m acting aloof or superior.',
        },
        'answer' : null,
        'scores': {
          'A': 0,
          'B': 0,
          'C': 0,
          'D': 0,
          'E': 0,
          'F': 0,
          'G': 0,
        },
      },
      {
        'questionText': 'Which statement best describes your experience of anger?',
        'options': {
          'A': 'My anger is like a firework, a sudden, bright explosion that quickly fades.',
          'B': 'My anger is a simmering pot that constantly feels like it\'s about to boil over.',
          'C': 'My anger is a roadblock, an obstacle that prevents me from moving forward.',
          'D': 'My anger is a lingering bad taste in my mouth, a bitterness that stays with me.',
          'E': 'My anger is a frozen lake—still on the surface, but deep and cold underneath.',
          'F': 'My anger is like a heavy stone in my heart, a profound and serious weight.',
          'G': 'My anger is a shield that I use to show my disapproval and power.',
        },
        'answer' : null,
        'scores': {
          'A': 0,
          'B': 0,
          'C': 0,
          'D': 0,
          'E': 0,
          'F': 0,
          'G': 0,
        },
      },
      {
        'questionText': 'What\'s your typical thought process when you\'re angry?',
        'options': {
          'A': '"I can\'t believe this is happening! I\'m so mad!"',
          'B': '"This is so frustrating. I wish I could just get this over with."',
          'C': '"This is so annoying and pointless. Why is this person being like this?"',
          'D': '"It\'s not fair. Why do they get to do that?"',
          'E': '"I\'m so angry I can\'t even talk about it."',
          'F': '"This is fundamentally wrong. I have been truly wronged."',
          'G': '"How could they be so stupid/incompetent? They are beneath me."',
        },
        'answer' : null,
        'scores': {
          'A': 0,
          'B': 0,
          'C': 0,
          'D': 0,
          'E': 0,
          'F': 0,
          'G': 0,
        },
      },
      {
        'questionText': 'How long does your anger usually last?',
        'options': {
          'A': 'It\'s intense but usually passes quickly.',
          'B': 'It\'s a low-level feeling that can last for hours or even days.',
          'C': 'It goes away once the frustrating situation is resolved.',
          'D': 'It can linger for a long time, often in the form of a grudge.',
          'E': 'It can be held for a very long time, never truly being expressed.',
          'F': 'It is a fundamental part of a serious issue and can last indefinitely.',
          'G': 'It fades once I feel I have successfully asserted my dominance.',
        },
        'answer' : null,
        'scores': {
          'A': 0,
          'B': 0,
          'C': 0,
          'D': 0,
          'E': 0,
          'F': 0,
          'G': 0,
        },
      },
    ],
  };

  _handleSubmitSurvey(BuildContext context) async {
    //Check all questions have been answered
    bool hasNullAnswer = angerSpectrumQuiz['questions'].any((question) => question['answer'] == null);
    if(hasNullAnswer) {
      if(context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please complete all questions to proceed.')));
      }
      return;
    }
    //Calculate the score and the carrot
    Map<String,int> scores = {
      'red' : 0,
      'orange' : 0,
      'yellow' : 0,
      'green' : 0,
      'blue' : 0,
      'indigo' : 0,
      'violet' : 0,
    };
    // int redScore = 0;
    // int orangeScore = 0;
    // int yellowScore = 0;
    // int greenScore = 0;
    // int blueScore = 0;
    // int indigoScore = 0;
    // int violetScore = 0;

    for (var question in angerSpectrumQuiz['questions']) {
      switch (question['answer']) {
        case 'A':
          if (scores['red'] != null) {
            scores['red'] = scores['red']! + 1;
          }
          break;
        case 'B':
          scores['orange'] = (scores['orange'] ?? 0) + 1;
          break;
        case 'C':
          scores['yellow'] = (scores['yellow'] ?? 0) + 1;
          break;
        case 'D':
          scores['green'] = (scores['green'] ?? 0) + 1;
          break;
        case 'E':
          scores['blue'] = (scores['blue'] ?? 0) + 1;
          break;
        case 'F':
          scores['indigo'] = (scores['indigo'] ?? 0) + 1;
          break;
        case 'G':
          scores['violet'] = (scores['violet'] ?? 0) + 1;
          break;
        default:
          logInfo("ANSWER NOT FOUND");
          return;
      }
      
      
    }


    logInfo("SCORES ${scores}");

    String carrotAwarded = "white";

    final bool allValuesEqual = scores.entries.every((entry) => entry.value == scores.entries.first.value);

    if(allValuesEqual) {
      logInfo("ALL VALUES ARE EQUAL");
    } else {
      // Find the entry with the highest score
      var highestEntry = scores.entries.reduce((a, b) => a.value > b.value ? a : b);
      logInfo("Highest Entry ${highestEntry}");

      String highestScoringColor = highestEntry.key;
      int maxScore = highestEntry.value;

      logInfo('The highest scoring color is: $highestScoringColor with a score of: $maxScore');

      carrotAwarded = highestScoringColor;

    }

    print('CARROT AWARDED = $carrotAwarded');
    //Write to database
    if(context.mounted) {
      AppDatabase db = AppDatabase();
      DataProvider dataProvider = Provider.of(context,listen: false);

      //Fix selected contact for testing
      //dataProvider.setSelectedAppContact(dataProvider.appContacts[0]);
      try {
        Carrot insertedCarrot = await db.insertCarrot(dataProvider.selectedAppContact!, carrotAwarded);
        dataProvider.carrots.add(insertedCarrot);
        setState(() {
          _newCarrot = insertedCarrot;
        });
      } catch (err) {
        logError("UNABLE TO INSERT CARROT $err");

      }
    }

    showDialog(
      context: context, 
      builder: (context) {
        String colorCapitalized = AppUtils.capitalize(carrotAwarded);

        return AlertDialog(
          title: Text("$colorCapitalized Carrot", textAlign: TextAlign.center,),
          content: CarrotDisplayWidget(carrotColor: carrotAwarded),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _surveyComplete = true;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Ok')
            )
          ],
        );

      }
    );


  }

  List<QuestionWidget> getQuestionWidgets() {
    List<QuestionWidget> questionWidgets = [];

    for (Map<String,dynamic> questionItem in angerSpectrumQuiz['questions']) {
      questionWidgets.add(
        QuestionWidget(
          question: Question(
            text: questionItem['questionText'], 
            options: questionItem['options'],
          ), 
          onAnswerSelected: (ans) {
            logInfo("QUESTION ANSWERED");
            logInfo("QUESTION ${questionItem['questionText']} ANSWER: ${ans}");
            logInfo("QUESTION ${questionItem['options'][ans]}");

            //Set the selected answer
            setState(() {
              questionItem['answer'] = ans;
            });
            
          },
          selectedAnswer : questionItem['answer']
        )
      );
    }

    return questionWidgets;

  }

  @override
  Widget build(BuildContext context) {
    List<Widget> questionWidgets = getQuestionWidgets();
    logInfo(questionWidgets);

    if(_surveyComplete) {
      return Column(
        children: [
          const Text(
            'Congratulations!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 10,),
          Image.asset('assets/rabbit_mascot_celebrate.png', height: 200,),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton1(
                onPressed: () => AppUtils.onShareImage(context, _newCarrot!), 
                label: 'Send'
              ),
              CustomButton1(
                onPressed: () => Navigator.of(context).popAndPushNamed("/carrotdisplayscreen"), 
                label: 'My Carrots'
              ),
            ],
          )
        ]

      );
    }

    return Column(
      children: [
        ...questionWidgets,
        const SizedBox(height: 10,),
        CustomButton1(onPressed: () => _handleSubmitSurvey(context), label: "Finish",),
        const SizedBox(height: 10,)
      ]
    );
  }
}


class Question {
  final String text;
  final Map<String,dynamic> options;

  Question({required this.text, required this.options});
}

class QuestionWidget extends StatelessWidget {
  final Question question;
  final void Function(String) onAnswerSelected;
  final String? selectedAnswer;

  const QuestionWidget({
    super.key,
    required this.question,
    required this.onAnswerSelected,
    this.selectedAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question.text,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            // Loop through the options to create selection buttons
            ...question.options.keys.toList().map((option) {

              final isSelected = option == selectedAnswer;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: ElevatedButton(
                  onPressed: () => onAnswerSelected(option),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isSelected ? Colors.blue : Colors.grey[300],
                    foregroundColor: isSelected ? Colors.white : Colors.black,
                  ),
                  child: Center(child: Text(question.options[option])),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
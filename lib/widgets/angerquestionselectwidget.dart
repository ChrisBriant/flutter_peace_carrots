import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';

class AngerQuestionSelect extends StatefulWidget {
  const AngerQuestionSelect({super.key});

  @override
  State<AngerQuestionSelect> createState() => _AngerQuestionSelectState();
}

class _AngerQuestionSelectState extends State<AngerQuestionSelect> {
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

  List<QuestionWidget> getQuestionWidgets() {
    List<QuestionWidget> questionWidgets = [];

    for (Map<String,dynamic> questionItem in angerSpectrumQuiz['questions']) {
      questionWidgets.add(
        QuestionWidget(
          question: Question(
            text: questionItem['questionText'], 
            options: questionItem['options']
          ), 
          onAnswerSelected: (str) {}
        )
      );
    }

    return questionWidgets;

  }

  @override
  Widget build(BuildContext context) {
    List<Widget> questionWidgets = getQuestionWidgets();
    logInfo(questionWidgets);

    return Column(
      children: questionWidgets,
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
            }).toList(),
          ],
        ),
      ),
    );
  }
}
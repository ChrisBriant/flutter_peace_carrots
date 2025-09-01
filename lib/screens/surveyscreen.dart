import 'package:flutter/material.dart';
import 'package:peacecarrots/widgets/angerquestionselectwidget.dart';
import '../widgets/textboxwidget.dart';
import '../widgets/boxcontent.dart';

class SurveyScreen extends StatelessWidget {
  static const String routeName = "/surveyscreen";

  const SurveyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Anger Survey',
          style: TextStyle(
            color: Colors.white
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/clouds_thunder_bg.jpg'),
            repeat: ImageRepeat.repeat,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10,),
              TextBoxWidget(
                backgroundColor: Colors.red.shade400,
                textColor: Colors.white,
                borderColor: Colors.green,
                size: 16,
                text: "Take the survey below to make a peace carrot.",
              ),
              const SizedBox(height: 10,),
              BoxContent(
                backgroundColor: Colors.red.shade400,
                borderColor: Colors.green,
                child: AngerQuestionSelect(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
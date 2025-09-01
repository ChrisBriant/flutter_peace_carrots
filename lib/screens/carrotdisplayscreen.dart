import 'package:flutter/material.dart';
import 'package:peacecarrots/widgets/boxcontent.dart';
import 'package:peacecarrots/widgets/carrotlistwidget.dart';
import 'package:peacecarrots/widgets/custombutton1.dart';
import 'package:peacecarrots/widgets/textboxwidget.dart';
import 'package:provider/provider.dart';
import '../providers/dataprovider.dart';

class CarrotDisplayScreen extends StatelessWidget {
  static const routeName = "/carrotdisplayscreen";

  const CarrotDisplayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Carrots", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/clouds_bg.jpg'),
            repeat: ImageRepeat.repeat,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10,),
              Image.asset('assets/rabbit_mascot_holding_carrot_torso.png', height: 200,),
              TextBoxWidget(
                text: 'Tap on a carrot below to view it.', 
                backgroundColor: Colors.indigo, 
                textColor: Colors.white, 
                size: 14, 
                borderColor: Colors.white
              ),
              const SizedBox(height: 10,),
              CustomButton1(
                onPressed: () => Navigator.of(context).popAndPushNamed("/glossaryscreen"), 
                label: "Glossary"
              ),
              const SizedBox(height: 10,),
              BoxContent(
                backgroundColor: Colors.indigo, 
                borderColor: Colors.white,
                child: Column(
                  children: [
                    const Text(
                      'Tap on a carrot below to view it.',
                      style: TextStyle( color: Colors.white),
                    ),
                    const SizedBox(height: 10,),
                    Consumer<DataProvider>(
                      builder: (context, dataProvider, _) => CarrotList(
                        carrots: dataProvider.carrots
                      )
                    )
                  ],
                )
              ),
              const SizedBox(height: 10,),
              CustomButton1(
                onPressed: () => Navigator.of(context).popAndPushNamed("/addpersonscreen"), 
                label: "Make Peace"
              )
            ],
          ),
        ),
      ),
    );
  }
}
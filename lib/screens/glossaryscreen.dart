import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';
import 'package:peacecarrots/utils/utils.dart';
import '../widgets/textboxwidget.dart';
import '../widgets/boxcontent.dart';

class GlossaryScreen extends StatelessWidget {
  static const String routeName ="/glossaryscreen";

  const GlossaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> colors = AppUtils.angerCarrots.keys.toList();

    logInfo("Colors $colors");
    print("HELLO");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Glossary", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10,),
            Image.asset('assets/rabbit_mascot_head_and_torso.png', height: 200,),
            TextBoxWidget(
              text: 'These are the peace carrots and their meaning.', 
              backgroundColor: Colors.indigo, 
              textColor: Colors.white, 
              size: 14, 
              borderColor: Colors.white
            ),
            const SizedBox(height: 10,),
            BoxContent(
              backgroundColor: Colors.indigo, 
              borderColor: Colors.white,
              //child: SizedBox(),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .5,
                child: ListView.builder(
                  itemCount: colors.length,
                  itemBuilder: (ctx,idx) => ListTile(
                    leading: Image.asset('assets/${colors[idx]}_carrot.png'),
                    title: Text('${AppUtils.capitalize(colors[idx])} Carrot'),
                  )
                ),
              )
            ),
          ]
          

        ),
      ),
    );
  }
}
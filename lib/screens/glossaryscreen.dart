import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';
import 'package:peacecarrots/utils/utils.dart';
import 'package:peacecarrots/widgets/carrotdisplaywidget.dart';
import '../widgets/textboxwidget.dart';
import '../widgets/boxcontent.dart';

class GlossaryScreen extends StatelessWidget {
  static const String routeName ="/glossaryscreen";

  const GlossaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> colors = AppUtils.angerCarrots.keys.toList();

    logInfo("Colors $colors");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Glossary", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).popAndPushNamed('/carrotdisplayscreen'), 
            icon: Icon(Icons.exit_to_app, color: Colors.white,), 
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10,),
            Image.asset('assets/rabbit_mascot_head_and_torso.png', height: 200,),
            TextBoxWidget(
              text: 'These are the peace carrots. Tap to get an explanation of their meaning.', 
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
                  itemBuilder: (ctx,idx) {
                    String carrotDescription = AppUtils.capitalizeFirstOfEach(AppUtils.peaceCarrots[colors[idx]]["name"]); 

                    return Container(
                        padding: EdgeInsets.all(4),
                        margin: EdgeInsets.symmetric(vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.amber.shade100
                        ),
                        child: ListTile(
                          onTap: () => showDialog(
                            context: ctx, 
                            builder: (ctx) => AlertDialog(
                              title: Text(
                                "${AppUtils.capitalize(colors[idx])} Carrot",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              content: CarrotDisplayWidget(carrotColor: colors[idx], showOnlyAngerText: true, showCarrotTitle: true,),
                              actionsAlignment: MainAxisAlignment.center,
                              actions: [
                                ElevatedButton(
                                  onPressed: () => Navigator.of(ctx).pop(), 
                                  child: const Text("Ok")
                                )
                              ],
                            )
                          ),
                          leading: Image.asset('assets/${colors[idx]}_carrot.png'),
                          //title: Text('${AppUtils.capitalize(colors[idx])} Carrot'),
                          title: Text(carrotDescription),
                        ),
                      );

                  }
                ),
              )
            ),
          ]
          

        ),
      ),
    );
  }
}
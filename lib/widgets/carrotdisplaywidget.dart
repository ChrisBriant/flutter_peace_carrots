import 'package:flutter/material.dart';
import '../utils/utils.dart';

class CarrotDisplayWidget extends StatelessWidget {
  final String carrotColor;

  const CarrotDisplayWidget({
    required this.carrotColor,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    String angerText = AppUtils.angerCarrots[carrotColor]['text'];
    String peaceText = AppUtils.peaceCarrots[carrotColor]['text'];

    return SizedBox(
      height: MediaQuery.of(context).size.height * .4,
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Text("$colorCapitalized Carrot",
            //   style: TextStyle(
            //     fontSize: 20,
            //     fontWeight: FontWeight.bold
            //   ),
            // ),
            const SizedBox(height: 10,),
            Text(angerText,
              style: TextStyle(
                fontSize: 14
              ),
            ),
            const SizedBox(height: 10,),
            Image.asset('assets/${carrotColor}_carrot.png', height: 200,),
            const SizedBox(height: 10,),
            Text(peaceText,
              style: TextStyle(
                fontSize: 14
              ),
            ),
            const SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
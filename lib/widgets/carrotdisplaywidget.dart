import 'package:flutter/material.dart';
import '../utils/utils.dart';

class CarrotDisplayWidget extends StatelessWidget {
  final String carrotColor;
  final bool? showOnlyAngerText;
  final bool? showCarrotTitle;

  const CarrotDisplayWidget({
    required this.carrotColor,
    this.showOnlyAngerText,
    this.showCarrotTitle,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    String angerText = AppUtils.angerCarrots[carrotColor]['text'];
    String peaceText = AppUtils.peaceCarrots[carrotColor]['text'];
    String carrotTitle = AppUtils.capitalizeFirstOfEach(AppUtils.peaceCarrots[carrotColor]['name']);

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
            showCarrotTitle != null && showCarrotTitle == true
            ? Text(
              carrotTitle,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold
              ),
            )
            :SizedBox(),
            const SizedBox(height: 10,),
            Text(angerText,
              style: TextStyle(
                fontSize: 14
              ),
            ),
            const SizedBox(height: 10,),
            Image.asset('assets/${carrotColor}_carrot.png', height: 200,),
            const SizedBox(height: 10,),
            showOnlyAngerText == null || showOnlyAngerText == false
            ? Text(peaceText,
              style: TextStyle(
                fontSize: 14
              ),
            )
            : const SizedBox(),
            const SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
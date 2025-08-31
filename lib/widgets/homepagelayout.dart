import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/dataprovider.dart';

class HomePageLayout extends StatelessWidget {
  const HomePageLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Stack(
        alignment: AlignmentGeometry.bottomCenter,
        children: [
          Image.asset('assets/carrots_bg.jpg'),
          Container(
            color: Colors.black38,
            height: constraints.maxHeight * .9,
          ),
          Positioned(
            top: 10,
            child: Container(
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Image.asset(
                'assets/peace_carrots_text_white.png',
                fit: BoxFit.fill,
                // width: double.infinity,
                // height: 200,
              ),
            )
          ),
          Positioned(
            left: 10,
            bottom: 80,
            child: Image.asset('assets/rabbit_mascot.png')
          ),
          Positioned(
            bottom: 10,
            child: Consumer<DataProvider>(
              builder: (ctx,dataProvider,_) => ElevatedButton(
                onPressed: dataProvider.carrots.isEmpty ?  () => Navigator.of(context).popAndPushNamed('/addpersonscreen') : () => Navigator.of(context).popAndPushNamed('/carrotdisplayscreen'), 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black87, // Transparent button background
                    foregroundColor: Colors.white, // White text color
                    side: const BorderSide(color: Colors.white, width: 4), // White border
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Rounded corners
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15), // Spacious padding
                    elevation: 0, // No shadow for a flat, modern look
                ),
                child: const Text(
                  'Spread Peace!',
                  style: TextStyle(
                    fontSize: 20
                  ),
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}
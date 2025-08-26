import 'package:flutter/material.dart';
import 'package:peacecarrots/widgets/homepagelayout.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/homescreen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Peace Carrots",
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
      body: const HomePageLayout(),
    );
  }
}
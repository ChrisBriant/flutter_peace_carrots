import 'package:flutter/material.dart';
import 'package:peacecarrots/screens/homescreen.dart';
import 'package:peacecarrots/screens/loadingscreen.dart';
import 'package:peacecarrots/screens/surveyscreen.dart';
import './screens/addpersonscreen.dart';
import 'package:loggy/loggy.dart';
import 'package:provider/provider.dart';
import './providers/dataprovider.dart';
import 'package:flutter/services.dart';
import './data/database.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  Loggy.initLoggy();
  runApp(const PeaceCarrots());
}

class PeaceCarrots extends StatelessWidget {
  const PeaceCarrots({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Future<List<AppContact>> getContacts() async {
      
      List<AppContact> contacts = [];
      AppDatabase db = AppDatabase();

      try {
        contacts = await db.getAppContacts();
      } catch(err) {
        logError("Datbase error $err");
      }

      return contacts;
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => DataProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          // This is the theme of your application.
      
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: FutureBuilder<List<AppContact>>(
          future: getContacts(), 
          builder: (ctx,sn) {
            if(sn.connectionState == ConnectionState.waiting) {
              return const LoadingScreen();
            }

            if(sn.hasData) {
              logInfo("HAS DATA ${sn.data}");
            }

            //return const HomeScreen();
            return const SurveyScreen();
          }
        ),
        routes: {
          HomeScreen.routeName : (context) => const HomeScreen(),
          AddPersonScreen.routeName : (context) => const AddPersonScreen(),
          SurveyScreen.routeName : (context) => const SurveyScreen(),
        },
      ),
    );
  }
}

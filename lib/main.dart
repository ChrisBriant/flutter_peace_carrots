import 'package:flutter/material.dart';
import 'package:peacecarrots/screens/glossaryscreen.dart';
import 'package:peacecarrots/screens/homescreen.dart';
import 'package:peacecarrots/screens/loadingscreen.dart';
import 'package:peacecarrots/screens/surveyscreen.dart';
import './screens/carrotdisplayscreen.dart';
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

    Future<(List<AppContact>, List<Carrot>)> getContacts() async {
      AppDatabase db = AppDatabase();

      try {
        List<AppContact> contacts = await db.getAppContacts();
        //Needs to also get the carrots
        List<Carrot> carrots = await db.getAllCarrots(contacts);
        logInfo('DATA CARROTS FOUND $carrots');
        return (contacts, carrots);
      } catch (err) {
        logError("Database error: $err");
        // It's often better to re-throw the error so the caller knows something went wrong.
        rethrow;
      }
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
        home: FutureBuilder<(List<AppContact>, List<Carrot>)>(
          future: getContacts(), 
          builder: (ctx,sn) {
            if(sn.connectionState == ConnectionState.waiting) {
              return const LoadingScreen();
            }

            if(sn.hasData) {
              logInfo("HAS DATA ${sn.data}");
              //Update the provider
              DataProvider dataProvider = Provider.of(ctx,listen:false);
              dataProvider.setAppContacts(sn.data!.$1);
              dataProvider.setCarrots(sn.data!.$2);
            }

            return const HomeScreen();
            //return const SurveyScreen();
          }
        ),
        routes: {
          HomeScreen.routeName : (context) => const HomeScreen(),
          AddPersonScreen.routeName : (context) => const AddPersonScreen(),
          SurveyScreen.routeName : (context) => const SurveyScreen(),
          CarrotDisplayScreen.routeName : (context) => const CarrotDisplayScreen(),
          GlossaryScreen.routeName : (context) => const GlossaryScreen(),
        },
      ),
    );
  }
}

import 'package:CCHAIN/helpers/colors.dart';
import 'package:CCHAIN/screens/calculator/user_input_questions.dart';
import 'package:CCHAIN/screens/calculator/user_inputs.dart';
import 'package:CCHAIN/screens/home/startScreen.dart';
import 'package:CCHAIN/screens/reduce/reduce_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: Questions())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CCHAIN',
        theme: ThemeData(
          fontFamily: "Orbitron",
          primarySwatch: Colors.indigo,
          inputDecorationTheme: const InputDecorationTheme(
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              color: ColorPallete.color3,
            ),),
          ),
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity, textSelectionTheme: const TextSelectionThemeData(cursorColor: ColorPallete.color3),
        ),
        initialRoute: StartScreen.routeName,
        // home: ResultScreen(
        //         activityName: "Household",
        //         userEmission: 70,
        //         averageEmission: 50,
        //       ),//HomeScreen.routeName dfdfgfgf,
      
        routes: {
          StartScreen.routeName: (context) => StartScreen(),
          UserInputs.routeName: (context) => UserInputs(),
          ReduceEmissionScreen.routeName: (context) => ReduceEmissionScreen(),
        },
      ),
    );
  }
}

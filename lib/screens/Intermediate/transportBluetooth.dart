import 'package:CCHAIN/helpers/colors.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import '../calculator/user_inputs.dart';

const TextStyle kTextStyle = TextStyle(
  fontSize: 24.0,
  color: ColorPallete.color3,
  shadows: [
    Shadow(
      color: ColorPallete.color3,
      blurRadius: 3,
      offset: Offset(
        0.9,
        0.9,
      ),
    ),
    Shadow(
      color: ColorPallete.color3,
      blurRadius: 3,
      offset: Offset(
        1.2,
        1.2,
      ),
    ),
  ],
);

class TransportBluetooth extends StatelessWidget {
  static const String routeName = '/Transport_Bluetooth';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 200,
                  child: FlareActor(
                    'assets/flare/bicycle_flow.flr',
                    animation: 'flow',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: TypewriterAnimatedTextKit(
                    speed: const Duration(seconds: 1),
                    text: const ['Greetings!', 'Take the first step towards a greener future!', 'Start today!'],
                    textStyle: kTextStyle.copyWith(
                      fontFamily: "Orbitron",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    '"Unlock Your Carbon Consciousness!',
                    style: kTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        padding: const EdgeInsets.only(bottom: 16.0), // Adjust the padding as needed
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, UserInputs.routeName, arguments: 'travel'); // Navigate to the StartScreen
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorPallete.cardBackground.withBlue(150),
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            'Next',
            style: TextStyle(
              color: ColorPallete.color3,
            ),
          ),
        ),
      ),
    );
  }
}

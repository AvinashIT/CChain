import 'package:CCHAIN/helpers/colors.dart';
import 'package:CCHAIN/screens/Intermediate/TransportBluetooth.dart';
import 'package:CCHAIN/screens/Intermediate/manuOmr.dart';
import 'package:CCHAIN/screens/Intermediate/recOmr.dart';
import 'package:CCHAIN/screens/calculator/user_inputs.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

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

class StartScreen extends StatelessWidget {
  static const String routeName = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 200,
                child: FlareActor(
                  'assets/flare/WorldSpin.flr',
                  animation: 'roll',
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
                  text: const ['Greetings!', 'Begin Your Sustainability Journey', 'Start today!'],
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
              const CustomCard(
                'Manufacture',
                'assets/images/Manufacture.png',
                'Manufacture',
              ),
              const SizedBox(
                height: 8.0,
              ),
              const CustomCard(
                'Transport',
                'assets/images/finalcar.png',
                'travel',
              ),
              const SizedBox(
                height: 8.0,
              ),
              const CustomCard(
                'Recycle',
                'assets/images/Recycle.png',
                'Recycle',
              ),
              const SizedBox(
                height: 16.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String image;
  final String title;
  final String arg;
  // ignore: avoid_field_initializers_in_const_classes
  final String routeName = UserInputs.routeName;

  const CustomCard(
    this.title,
    this.image,
    this.arg,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (title == 'Transport') {
          Navigator.pushNamed(
            context,
            TransportBluetooth.routeName,
            arguments: arg,
          );
        } else if (title == 'Manufacture') {
          Navigator.pushNamed(
            context,
            ManuOme.routeName,
            arguments: arg,
          );
        }
        else{
          Navigator.pushNamed(
            context,
            RecOmr.routeName,
            arguments: arg,
          );
        }
      },
      child: Container(
        height: 150,
        margin: const EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: ColorPallete.cardBackground,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                image,
                height: 130,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: kTextStyle.copyWith(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Text(
                    'Calculate your carbon footprint.',
                    style: TextStyle(
                      color: ColorPallete.cardHeading,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

RichText myText = RichText(
  text: TextSpan(
    children: [
      TextSpan(
        text: 'Hey there! ',
        style: kTextStyle.copyWith(
          fontFamily: "Orbitron",
        ),
      ),
      const TextSpan(
        text: '👋',
        style: TextStyle(fontSize: 20),
      ),
    ],
  ),
);

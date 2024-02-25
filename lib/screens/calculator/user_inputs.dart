import 'package:CCHAIN/helpers/colors.dart';
import 'package:CCHAIN/helpers/helpers.dart';
import 'package:CCHAIN/screens/calculator/user_input_questions.dart';
import 'package:CCHAIN/screens/result/result_screen.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserInputs extends StatefulWidget {
  static const routeName = '/user-inputs';
  @override
  _UserInputsState createState() => _UserInputsState();
}

class _UserInputsState extends State<UserInputs> {
  List answers = [];

  int index = 0;

  final _answerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments! as String;
    final size = MediaQuery.of(context).size;

    final List recQ = Provider.of<Questions>(context).recQuestions;
    final List travelQ = Provider.of<Questions>(context).travelQuestions;
    final List manuQ = Provider.of<Questions>(context).manuQuestions;

    List questions = [];

    // print(args);

    if (args == 'Recycle') {
      questions = recQ;
    } else if (args == 'travel') {
      questions = travelQ;
    } else {
      questions = manuQ;
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: args == 'food'
              ? Stack(
            children: [
              Container(
                color: ColorPallete.background,
              ),
              const Positioned(
                child: FlareActor(
                  'assets/flare/base_two_flow.flr',
                  animation: 'flow',
                  fit: BoxFit.cover,
                  color: ColorPallete.background,
                ),
              ),
              if (index == 0 || index == 1)
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: FlareActor(
                    'assets/flare/food_1.flr',
                    animation: 'flow',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              if (index == 2 || index == 3)
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Image.asset(
                    'assets/images/eat_1.png',
                  ),
                ),
              Positioned(
                top: 150,
                child: SizedBox(
                  height: size.height,
                  width: size.width,
                  //decoration: BoxDecoration(color: ColorPallete.background),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40.0,
                          ),
                          child: Text(
                            questions[index],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: ColorPallete.color3,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Align(
                        child: SizedBox(
                          width: size.width * 0.4,
                          child: TextFormField(
                            controller: _answerController,
                            decoration: InputDecoration(
                              hintText: 'Kg/Kw',
                              hintStyle:
                              const TextStyle(color: ColorPallete.color4),
                              suffixIcon: IconButton(
                                icon: const Icon(
                                  Icons.trending_flat,
                                  color: ColorPallete.color3,
                                ),
                                onPressed: () {
                                  if (_answerController.text == '' ||
                                      _answerController is String) {
                                    return;
                                  }
                                  answers.add(double.parse(
                                    _answerController.text,),);
                                  if (index == questions.length - 1) {
                                    // print(answers);

                                    final double footprint = CarbonFootPrint
                                        .getDailyFoodCarbonFootPrint(
                                      answers[0],
                                      answers[1],
                                      answers[2],
                                      answers[3],);

                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ResultScreen(
                                              userEmission: footprint,
                                              averageEmission:
                                              CarbonFootPrint
                                                  .avgEmissionDueToFoodPerDay,
                                              activityName: "Recycle Unit",key:UniqueKey(),
                                            ),),);
                                  } else {
                                    index++;
                                  }
                                  _answerController.text = '';
                                  setState(() {});
                                },
                              ),
                              alignLabelWithHint: true,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 2,
                              ),
                            ),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                              color: ColorPallete.color3,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
              : args == 'travel'
              ? Stack(
            children: [
              Container(
                color: ColorPallete.background,
              ),
              const Positioned(
                child: FlareActor(
                  'assets/flare/base_one.flr',
                  animation: 'Flow',
                  fit: BoxFit.cover,
                ),
              ),
              if (index == 0 || index == 2)
                const FlareActor(
                  'assets/flare/bicycle_flow.flr',
                  animation: 'flow',
                  alignment: Alignment.bottomCenter,
                ),
              if (index == 1)
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    height: size.height * 0.3,
                    child: Image.asset(
                      'assets/images/car.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              Positioned(
                child: SizedBox(
                  height: size.height,
                  width: size.width,
                  //decoration: BoxDecoration(color: ColorPallete.background),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40.0,),
                          child: Text(
                            questions[index],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: ColorPallete.color3,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Align(
                        child: SizedBox(
                          width: size.width * 0.4,
                          child: TextFormField(
                            controller: _answerController,
                            decoration: InputDecoration(
                              hintText: 'Km/Lt',
                              hintStyle: const TextStyle(
                                color: ColorPallete.color4,),
                              //enabledBorder: InputBorder.none,
                              //filled: true,
                              //fillColor: ColorPallete.background.withBlue(-200),
                              suffixIcon: IconButton(
                                icon: const Icon(
                                  Icons.trending_flat,
                                  color: ColorPallete.color3,
                                ),
                                onPressed: () {
                                  if (_answerController.text == '' ||
                                      _answerController is String) {
                                    return;
                                  }
                                  answers.add(double.parse(
                                    _answerController.text,),);

                                  if (index == questions.length - 1) {
                                    // print(answers);

                                    final double footprint = CarbonFootPrint
                                        .getDailyTravelFootPrint(
                                      answers[0],
                                      answers[1],
                                      answers[2],);


                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ResultScreen(
                                              userEmission:
                                              footprint,
                                              averageEmission:
                                              CarbonFootPrint
                                                  .avgEmissionDueToTravelPerDay,
                                              activityName:
                                              "Transport Unit", key: UniqueKey(),
                                            ),),);
                                  } else {
                                    index++;
                                  }
                                  _answerController.text = '';
                                  setState(() {});
                                },
                              ),
                              alignLabelWithHint: true,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 2,
                              ),
                            ),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                              color: ColorPallete.color3,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
              : Stack(
            children: [
              Container(
                color: ColorPallete.background,
              ),
              const Positioned(
                child: FlareActor(
                  'assets/flare/base_water.flr',
                  animation: 'island01',
                  fit: BoxFit.cover,
                ),
              ),
              if (index == 0 || index == 1 || index == 2)
                const FlareActor(
                  'assets/flare/watch_tv.flr',
                  animation: 'flow',
                  alignment: Alignment.bottomCenter,
                ),
              if (index == 3)
                const FlareActor(
                  'assets/flare/water_flow.flr',
                  animation: 'flow',
                  alignment: Alignment.bottomRight,
                  fit: BoxFit.fitWidth,
                ),
              Positioned(
                child: SizedBox(
                  height: size.height,
                  width: size.width,
                  //decoration: BoxDecoration(color: ColorPallete.background),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40.0,),
                          child: Text(
                            questions[index],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: ColorPallete.color3,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Align(
                        child: SizedBox(
                          width: size.width * 0.4,
                          child: TextFormField(
                            controller: _answerController,
                            decoration: InputDecoration(
                              hintText: index == 3 ? '' : 'Kg/Kw',
                              hintStyle: const TextStyle(
                                color: ColorPallete.color4,),
                              //enabledBorder: InputBorder.none,
                              //filled: true,
                              //fillColor: ColorPallete.background.withBlue(-200),
                              suffixIcon: IconButton(
                                icon: const Icon(
                                  Icons.trending_flat,
                                  color: ColorPallete.color3,
                                ),
                                onPressed: () {
                                  if (_answerController.text == '' ||
                                      _answerController is String) {
                                    return;
                                  }
                                  answers.add(double.parse(
                                    _answerController.text,),);

                                  if (index == questions.length - 1) {
                                    // print(answers);

                                    final double footprint = CarbonFootPrint
                                        .getDailyHouseHoldCarbonFootPrint(
                                      answers[0],
                                      answers[1],
                                      answers[2],
                                      answers[3],);

                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ResultScreen(
                                              userEmission: footprint,
                                              averageEmission: CarbonFootPrint
                                                  .avgEmissionDueToHouseHoldPerDay,
                                              activityName: "Manufacture Unit", key: UniqueKey(),
                                            ),
                                      ),
                                    );
                                  } else {
                                    index++;
                                  }
                                  _answerController.text = '';
                                  setState(() {});
                                },
                              ),
                              alignLabelWithHint: true,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 2,
                              ),
                            ),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                              color: ColorPallete.color3,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
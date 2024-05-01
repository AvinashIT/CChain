import 'dart:async';
import 'dart:math';

import 'package:CCHAIN/helpers/colors.dart';
import 'package:CCHAIN/helpers/helpers.dart';
import 'package:CCHAIN/screens/calculator/user_input_questions.dart';
import 'package:CCHAIN/screens/result/result_screen.dart';
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
  bool fetching = false;
  int delaySeconds = 3;
  bool bluetoothAllowed = false; // Flag to track whether Bluetooth is allowed or not

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments! as String;
    final size = MediaQuery.of(context).size;

    final List recQ = Provider.of<Questions>(context).recQuestions;
    final List travelQ = Provider.of<Questions>(context).travelQuestions;
    final List manuQ = Provider.of<Questions>(context).manuQuestions;

    List questions = [];

    if (args == 'Recycle') {
      questions = recQ;
    } else if (args == 'travel') {
      questions = travelQ;
    } else {
      questions = manuQ;
    }

    return Scaffold(
      body: GestureDetector(
        // Gesture detector to detect right swipe gesture
        onHorizontalDragEnd: (DragEndDetails details) {
          if (details.primaryVelocity! > 0) {
            // If swipe is from left to right, navigate back
            Navigator.of(context).pop();
          }
        },
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  color: ColorPallete.background,
                ),
                Positioned(
                  top: 150,
                  child: SizedBox(
                    height: size.height,
                    width: size.width,
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
                            child: Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    // Check if Bluetooth is already allowed
                                    if (!bluetoothAllowed) {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            backgroundColor: ColorPallete.background,
                                            title: const Text(
                                              "Connect Bluetooth",
                                              style: TextStyle(
                                                color: ColorPallete.color3, // Text color for "Connect Bluetooth"
                                              ),
                                            ),
                                            content:const Text(
                                              "Allow or block?",
                                              style: TextStyle(
                                                color: ColorPallete.color3, // Text color for "Allow or block?"
                                              ),
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text(
                                                  "Block",
                                                  style: TextStyle(
                                                    color: ColorPallete.color3, // Text color for "Block"
                                                  ),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  // Set bluetoothAllowed to true
                                                  setState(() {
                                                    bluetoothAllowed = true;
                                                  });
                                                  // Start fetching after delay
                                                  setState(() {
                                                    fetching = true;
                                                  });
                                                  Timer(Duration(seconds: delaySeconds), () {
                                                    setState(() {
                                                      fetching = false;
                                                    });
                                                    _answerController.text =
                                                        Random().nextInt(100).toString();
                                                  });
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text(
                                                  "Allow",
                                                  style: TextStyle(
                                                    color: ColorPallete.color3, // Text color for "Allow"
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    } else {
                                      // If Bluetooth is already allowed, start fetching immediately
                                      setState(() {
                                        fetching = true;
                                      });
                                      Timer(Duration(seconds: delaySeconds-2), () {
                                        setState(() {
                                          fetching = false;
                                        });
                                        _answerController.text =
                                            Random().nextInt(100).toString();
                                      });
                                    }
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(ColorPallete.background),
                                  ),
                                  child: Row(
                                    children: [
                                      if (fetching) const SizedBox(
                                              width: 24,
                                              height: 24,
                                              child: CircularProgressIndicator(
                                                strokeWidth: 2,
                                                valueColor: AlwaysStoppedAnimation<Color>(
                                                  ColorPallete.color3,
                                                ),
                                              ),
                                            ) else const Icon(Icons.autorenew, color: ColorPallete.color3),
                                      const SizedBox(width: 5),
                                      Text(
                                        fetching ? 'Fetching...' : 'Auto', // Set text color for "Auto" button
                                        style: const TextStyle(
                                          color: ColorPallete.color3,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: TextFormField(
                                    controller: _answerController,
                                    decoration: InputDecoration(
                                      hintText: args == 'travel' && index == 0 ? 'Km/Lt' : 'Kg/Kw',
                                      hintStyle: const TextStyle(
                                        color: ColorPallete.color4,
                                      ),
                                      suffixIcon: IconButton(
                                        icon: const Icon(
                                          Icons.trending_flat,
                                          color: ColorPallete.color3,
                                        ),
                                        onPressed: () {
                                          if (_answerController.text.isEmpty) {
                                            return;
                                          }
                                          if (double.tryParse(_answerController.text) == null) {
                                            // If input is not a valid double, add it as a string
                                            answers.add(_answerController.text);
                                          } else {
                                            answers.add(double.parse(_answerController.text));
                                          }
                                          if (index == questions.length - 1) {
                                            double footprint;
                                            if (args == 'Recycle') {
                                              footprint = CarbonFootPrint.getRecycleFootPrint(
                                                answers[0],
                                                answers[1],
                                                answers[2],
                                              );
                                            } else if (args == 'travel') {
                                              footprint = CarbonFootPrint.getTravelFootPrint(
                                                answers[0],
                                                answers[1],
                                                answers[2],
                                                answers[3],
                                              );
                                            } else {
                                              footprint = CarbonFootPrint.getManufacturingFootPrint(
                                                answers[0],
                                                answers[1],
                                                answers[2],
                                              );
                                            }
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => ResultScreen(
                                                  userEmission: footprint,
                                                  averageEmission: args == 'Recycle'
                                                      ? CarbonFootPrint.avgEmissionDueToRecyclePerDay
                                                      : args == 'travel'
                                                          ? CarbonFootPrint.avgEmissionDueToManufacture
                                                          : CarbonFootPrint.avgEmissionDueToTravel,
                                                  activityName: args == 'Recycle'
                                                      ? "Recycle Unit"
                                                      : args == 'travel'
                                                          ? "Transport Unit"
                                                          : "Manufacture Unit",
                                                  key: UniqueKey(),
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
                                    keyboardType: args == 'travel' && index == 0
                                        ? TextInputType.text
                                        : TextInputType.number,
                                    style: const TextStyle(
                                      color: ColorPallete.color3,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:CCHAIN/helpers/colors.dart';
import 'package:CCHAIN/helpers/text_theme.dart';
import 'package:CCHAIN/screens/reduce/reduce_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

class ResultScreen extends StatelessWidget {
  final double userEmission;
  final double averageEmission;
  final String activityName;

  static const routeName = "/result";

  ResultScreen({
    required Key key,
    required this.activityName,
    required this.userEmission,
    required this.averageEmission,
  }) : super(key: key);

  Text toolTipLabel = const Text(
    " kg CO2",
    style: TextStyle(
      fontSize: 30,
      color: ColorPallete.color3,
    ),
  );

  double roundOff(double value) {
    return double.parse(value.toStringAsFixed(2));
  }

  double getChangePercentage() {
    double changePercent =
        ((userEmission - averageEmission) / averageEmission) * 100;

    changePercent = changePercent >= 0 ? changePercent : -changePercent;

    return roundOff(changePercent);
  }

  List<Widget> getDataGrids(String changePrefix, double changePercent) {
    final List<Map> emissionDatas = [
      {
        'text': 'Your carbon footprint for $activityName activities',
        'figure': '${roundOff(userEmission)} kg CO2',
        'icon': Icons.person_outline,
      },
      {
        'text': 'Average carbon footprint for $activityName',
        'figure': '${roundOff(averageEmission)} kg CO2',
        'icon': Icons.nature_people,
      },
      {
        'text': 'You are emitting $changePrefix emission than average',
        'figure': '$changePercent %',
        'icon': Icons.track_changes,
      },
    ];

    final List<Widget> widgetList = [];

    for (final emissionData in emissionDatas) {
      final Widget listItem = Card(
        elevation: 2,
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: ColorPallete.cardBackground,
        child: ListTile(
          title: CoolText(
            emissionData['figure'],
            fontSize: 18,
            letterSpacing: 1.1,
          ),
          subtitle: Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: Text(
              emissionData['text'],
              style: const TextStyle(
                color: ColorPallete.color7,
                fontSize: 13,
                letterSpacing: 0.7,
              ),
            ),
          ),
          trailing: Icon(
            emissionData['icon'],
            color: ColorPallete.color3,
          ),
        ),
      );

      widgetList.add(listItem);
    }

    return widgetList;
  }

  @override
  Widget build(BuildContext context) {
    FlutterSliderHandler leftHandler;
    FlutterSliderHandler rightHandler;

    final FlutterSliderHandler userHandler = FlutterSliderHandler(
      child: Material(
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        color: ColorPallete.color4,
        elevation: 3,
        child: Container(
          padding: const EdgeInsets.all(5),
          child: const Icon(
            Icons.person,
            size: 25,
            color: ColorPallete.color3,
          ),
        ),
      ),
    );

    final FlutterSliderHandler avgHandler = FlutterSliderHandler(
      child: Material(
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        color: ColorPallete.color3,
        shadowColor: ColorPallete.cardBackground,
        elevation: 3,
        child: Container(
          padding: const EdgeInsets.all(5),
          child: const Icon(
            Icons.nature_people,
            size: 25,
            color: ColorPallete.color4,
          ),
        ),
      ),
    );

    List<double> values = [roundOff(userEmission), roundOff(averageEmission)];
    Color trackBarColor = Colors.greenAccent;
    leftHandler = userHandler;
    rightHandler = avgHandler;
    String changePercentageSuffix = "less";

    final double changePercent = getChangePercentage();

    if (userEmission > averageEmission) {
      values = [roundOff(averageEmission), roundOff(userEmission)];
      trackBarColor = Colors.red;
      leftHandler = avgHandler;
      rightHandler = userHandler;
      changePercentageSuffix = "more";
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorPallete.cardBackground,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
            color: ColorPallete.color7,
          ),
          title: Text(
            "$activityName carbon footprint",
            style: const TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 16,
              color: ColorPallete.color7,
            ),
          ),
        ),
        backgroundColor: ColorPallete.background,
        body: SingleChildScrollView(
          child: Column(
            children: [
              ColoredBox(
                color: ColorPallete.cardBackground,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CoolText(
                        "${roundOff(userEmission)} kg CO2",
                        fontSize: 22,
                        letterSpacing: 1.1,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Your carbon footprint is $changePercent% $changePercentageSuffix than an average person",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: ColorPallete.color7,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: <Widget>[
                    Card(
                      elevation: 2,
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      color: ColorPallete.cardBackground,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: FlutterSlider(
                          step: const FlutterSliderStep(step: 0.01),
                          values: values,
                          rangeSlider: true,
                          disabled: true,
                          min: 0,
                          max: values[1] + values[1] / 10,
                          trackBar: FlutterSliderTrackBar(
                            activeDisabledTrackBarColor: trackBarColor,
                            inactiveDisabledTrackBarColor:
                                ColorPallete.color6,
                          ),
                          handler: leftHandler,
                          rightHandler: rightHandler,
                          tooltip: FlutterSliderTooltip(
                            positionOffset:
                                FlutterSliderTooltipPositionOffset(top: -5),
                            boxStyle: const FlutterSliderTooltipBox(
                              decoration: BoxDecoration(
                                color: ColorPallete.cardBackground,
                              ),
                            ),
                            alwaysShowTooltip: true,
                            textStyle: const TextStyle(
                              fontSize: 60,
                              color: Colors.white,
                            ),
                            leftSuffix: toolTipLabel,
                            rightSuffix: toolTipLabel,
                          ),
                        ),
                      ),
                    ),
                    ...getDataGrids(
                      changePercentageSuffix,
                      changePercent,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      thickness: 0.7,
                      color: ColorPallete.color6,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          ReduceEmissionScreen.routeName,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: ColorPallete.cardBackground.withBlue(150),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: CoolText(
                          "Reduce carbon emissions",
                          fontSize: 18,
                          letterSpacing: 1.1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

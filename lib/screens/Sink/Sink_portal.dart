import 'package:CCHAIN/helpers/colors.dart';
import 'package:CCHAIN/helpers/text_theme.dart';
import 'package:CCHAIN/screens/home/startScreen.dart';
import 'package:flutter/material.dart';

class SinkPortal extends StatelessWidget {
  static const routeName = "/Sink_portal";

  List<Widget> getWidgetTree(BuildContext context) {
    final List reduceCarbonFootPrintmsgs = [
      {
        'icon': Icons.balance,
        'title': "Balancing carbon emissions through tree planting",
        'options': [
          {
            'icon': Icons.nature,
            'message': "Nature is the best remedy for reducing carbon emissions and nurturing our planet\'s health",
          },
          {
            'icon': Icons.next_plan,
            'message': 'Participate in preserving the planet from carbon emissions and climate change',
          },
          {
            'icon': Icons.done_outline,
            'message': "Balance the carbon footprint and secure the future by planting trees",
          },
        ],
      },
      {
        'icon': Icons.card_travel,
        'title': 'Explore a variety of tree options for purchasing',
        'options': [
          {
            'image': 'assets/images/tree.png',
            'message': 'Oak trees are known to absorb and store about 48 pounds of CO2 per year',
          },
          {
            'image': 'assets/images/autumn.png',
            'message': 'Autumn trees can store and absorb about 100 pounds of CO2 per year.',
          },
          {
            'image': 'assets/images/pine.png',
            'message': "Pine trees typically store and absorb around 30 pounds of CO2 per year",
          },
        ],
      },
      {
        'icon': Icons.fastfood,
        'title': 'Ewaste Management Policies',
        'options': [
          {
            'icon': Icons.do_not_disturb_alt,
            'message': "E-waste recycling conserves resources by extracting valuable materials!",
          },
          {
            'icon': Icons.done_outline,
            'message': "Convenient E-waste collection helps prevent landfill pollution!",
          },
          {
            'icon': Icons.do_not_disturb_alt,
            'message': "Stringent policies enforce producer accountability in e-waste management!",
          },
        ],
      },
    ];

    final List<Widget> parentWidgetTree = [];

    for (final reduceEmissionData in reduceCarbonFootPrintmsgs) {
      List<Widget> widgetTree = [];

      widgetTree.add(
        const SizedBox(
          height: 15,
        ),
      );

      final Widget cardHeader = ListTile(
        leading: Icon(
          reduceEmissionData['icon'],
          color: ColorPallete.color3,
        ),
        title: CoolText(
          reduceEmissionData['title'],
          fontSize: 17,
          letterSpacing: 0,
        ),
      );

      widgetTree.add(cardHeader);

      final List<Widget> sectionDivider = [
        const SizedBox(
          height: 8,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Divider(
            thickness: 1,
            color: ColorPallete.color6,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
      ];

      widgetTree = [...widgetTree, ...sectionDivider];

      for (final option in reduceEmissionData['options']) {
        final Widget optionWidget = Column(
          children: [
            ListTile(
              leading: option['image'] != null
                  ? Image.asset(
                option['image'],
                width: 60, // Adjust width as needed
                height: 60, // Adjust height as needed
              )
                  : Icon(
                option['icon'],
                color: ColorPallete.color3,
              ),
              title: Text(
                option['message'],
                style: const TextStyle(
                  color: ColorPallete.color3,
                ),
              ),
            ),
            if (reduceEmissionData['icon'] == Icons.card_travel) // Only add Home button if the card is for tree options
              SizedBox(
                width: double.infinity,
                child: Container(
                  height: 50, // Adjust height for a pleasing appearance
                  width: double.infinity, // Set the width to match the Home button
                  child: Center(
                    child: TextButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          StartScreen.routeName,
                        );
                      },
                      icon: const Icon(Icons.shopping_cart,
                          color: ColorPallete.color3,), // Change the icon color here
                      label: const Text(
                        'Buy',
                        style: TextStyle(color: ColorPallete.color3), // Specify the color for the Buy button text here
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(ColorPallete.cardBackground.withBlue(150)), // Set the background color here
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30), // Adjust the border radius for a pleasing shape
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        );

        widgetTree.add(optionWidget);
      }

      widgetTree.add(
        const SizedBox(
          height: 10,
        ),
      );

      final Widget parentWidget = Container(
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        child: Card(
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: ColorPallete.cardBackground,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widgetTree,
            ),
          ),
        ),
      );

      parentWidgetTree.add(parentWidget);
    }

    return parentWidgetTree;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            ...getWidgetTree(context),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: ColorPallete.cardBackground.withBlue(150),
        onPressed: () {
          Navigator.pushNamed(
            context,
            StartScreen.routeName,
          );
        },
        label: const Text(
          "Home",
          style: TextStyle(
            color: ColorPallete.color3,
          ),
        ),
        icon: const Icon(
          Icons.home,
          color: ColorPallete.color3,
        ),
      ),
    );
  }
}

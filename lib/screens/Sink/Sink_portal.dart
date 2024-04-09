// ignore_for_file: avoid_dynamic_calls

import 'package:CCHAIN/helpers/colors.dart';
import 'package:CCHAIN/helpers/text_theme.dart';
import 'package:CCHAIN/screens/home/startScreen.dart';
import 'package:flutter/material.dart';

class SinkPortal extends StatefulWidget {
  static const routeName = "/Sink_portal";

  @override
  _SinkPortalState createState() => _SinkPortalState();
}

class _SinkPortalState extends State<SinkPortal> {
  final ScrollController _scrollController = ScrollController();
  bool _showHomeButton = false;
  int pinCode = 0; // Added pin code variable

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
        _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        _showHomeButton = true;
      });
    } else {
      setState(() {
        _showHomeButton = false;
      });
    }
  }

  List<Widget> getWidgetTree(BuildContext context) {
    final List reduceCarbonFootPrintmsgs = [
      {
        'icon': Icons.balance,
        'title': "Balancing carbon emissions through tree planting",
        'options': [
          {
            'icon': Icons.nature,
            'message': "Nature is the best remedy for reducing carbon emissions and nurturing our planet's health",
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
            'message': 'Palm trees can store and absorb about 50 to 100 pounds of CO2 per year.',
          },
          {
            'image': 'assets/images/pine.png',
            'message': "Pine trees typically store and absorb around 30 pounds of CO2 per year",
          },
        ],
      },
      {
        'icon': Icons.receipt,
        'title': 'Ewaste Management Policies',
        'options': [
          {
            'icon': Icons.done_outline,
            'message': "Manage E-waste to go green!",
          },
          {
            'icon': Icons.do_not_disturb_alt,
            'message': "Find Nearest E-Waste Management Point",
            'inputBox': true, // Added to indicate an input box is needed
          },
          {
            'icon': Icons.details,
            'message': pinCode == 605007 ? "Gmail:pudueplan@gmail.com\nPhone:+91 123456789\n4,Jaya Nagar,Pondy" : pinCode == 605009 ? "Gmail:chneplan@gmail.com\nPhone:+91 987654321\nAddress:12,Raja nagar,Chennai" : "Inconvenience Today for a better Tomorrow", // Updated message based on pin code
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
            if (option['inputBox'] == true) // Check if an input box is needed
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.format_list_numbered, // Add the number icon here
                      color: ColorPallete.color3, // Set the icon color
                    ),
                    labelText: 'Enter Pin',
                    labelStyle: TextStyle(color: ColorPallete.color3),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorPallete.color3,
                      ), // Set the border color here
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  // Set keyboardType to number
                  style: const TextStyle(
                    color: ColorPallete.color3,
                  ), // Set text color inside the text box
                  onChanged: (value) {
                    setState(() {
                      pinCode = int.tryParse(value) ?? 0; // Update the pin code value
                    });
                  },
                ),
              ),
            if (reduceEmissionData['icon'] == Icons.card_travel) // Only add Home button if the card is for tree options
              SizedBox(
                width: double.infinity,
                child: SizedBox(
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
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: ColorPallete.color3,
                      ), // Change the icon color here
                      label: const Text(
                        'Buy',
                        style: TextStyle(
                          color: ColorPallete.color3,
                        ), // Specify the color for the Buy button text here
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          ColorPallete.cardBackground.withBlue(150),
                        ), // Set the background color here
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
        controller: _scrollController,
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            ...getWidgetTree(context),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _showHomeButton
          ? FloatingActionButton.extended(
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
      )
          : null,
    );
  }
}

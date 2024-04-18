// ignore_for_file: avoid_dynamic_calls

import 'package:CCHAIN/helpers/colors.dart';
import 'package:CCHAIN/helpers/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SinkPortal extends StatefulWidget {
  static const routeName = "/Sink_portal";

  @override
  _SinkPortalState createState() => _SinkPortalState();
}

class _SinkPortalState extends State<SinkPortal> {
  final ScrollController _scrollController = ScrollController();
  bool _showHomeButton = false;

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
   void _openGoogleMaps() async {
    const url = 'https://www.google.com/maps?q=e_waste_management';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
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
            'message':
                "Nature is the best remedy for reducing carbon emissions and nurturing our planet's health",
          },
          {
            'icon': Icons.next_plan,
            'message':
                'Participate in preserving the planet from carbon emissions and climate change',
          },
          {
            'icon': Icons.done_outline,
            'message':
                "Balance the carbon footprint and secure the future by planting trees",
          },
        ],
      },
      {
        'icon': Icons.card_travel,
        'title': 'Explore a variety of tree options for purchasing',
        'options': [
          {
            'image': 'assets/images/tree.png',
            'message':
                'Oak trees are known to absorb and store about 48 pounds of CO2 per year',
            'qrImage': 'assets/images/qr.png',
            'qrText': 'Oak Tree',
          },
          {
            'image': 'assets/images/autumn.png',
            'message':
                'Palm trees can store and absorb about 50 to 100 pounds of CO2 per year.',
            'qrImage': 'assets/images/qr.png',
            'qrText': 'Palm Tree',
          },
          {
            'image': 'assets/images/pine.png',
            'message':
                "Pine trees typically store and absorb around 30 pounds of CO2 per year",
            'qrImage': 'assets/images/qr.png',
            'qrText': 'Pine Tree',
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
                      width: 60,
                      height: 60,
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
            if (reduceEmissionData['icon'] == Icons.card_travel)
              SizedBox(
                width: double.infinity,
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Center(
                    child: TextButton.icon(
                      onPressed: () {
                        _showImageDialog(
                            context, option['qrImage'], option['qrText']);
                      },
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: ColorPallete.color3,
                      ),
                      label: const Text(
                        'Buy',
                        style: TextStyle(
                          color: ColorPallete.color3,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          ColorPallete.cardBackground.withBlue(150),
                        ),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
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

  void _showImageDialog(BuildContext context, String qrImage, String qrText) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: ColorPallete.cardBackground,
          title: Text(
            qrText,
            style: const TextStyle(color: ColorPallete.color3),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                qrImage,
                width: 200,
                height: 200,
              ),
              const Text(
                'Name: farmer1',
                style: TextStyle(color: ColorPallete.color3),
              ),
              const Text(
                'Location: puducerry',
                style: TextStyle(color: ColorPallete.color3),
              ),
              const Text(
                'Contact: 122345667',
                style: TextStyle(color: ColorPallete.color3),
              ),
              const Text(
                'Price: 500 INR/per tree',
                style: TextStyle(color: ColorPallete.color3),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "Close",
                style: TextStyle(color: ColorPallete.color3),
              ),
            ),
          ],
        );
      },
    );
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
              backgroundColor:
                  ColorPallete.cardBackground.withBlue(150),
             onPressed: _openGoogleMaps,
              label: const Text(
                "Maps",
                style: TextStyle(
                  color: ColorPallete.color3,
                ),
              ),
              icon: const Icon(
                Icons.map,
                color: ColorPallete.color3,
              ),
            )
          : null,
    );
  }
}

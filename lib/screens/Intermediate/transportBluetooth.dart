import 'package:CCHAIN/helpers/colors.dart';
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

class TransportBluetooth extends StatefulWidget {
  static const String routeName = '/Transport_Bluetooth';

  @override
  _TransportBluetoothState createState() => _TransportBluetoothState();
}

class _TransportBluetoothState extends State<TransportBluetooth> {
  TextEditingController nameController = TextEditingController();
  TextEditingController input1Controller = TextEditingController();
  TextEditingController input2Controller = TextEditingController();
  TextEditingController input3Controller = TextEditingController();
  TextEditingController input4Controller = TextEditingController();
  List<String> vehicleTypes = ['BlueDart', 'DHL', 'Amazon', 'Agarwal Packets'];
  String selectedVehicleType = 'DHL'; // Default value
  String selectedType = 'Truck'; // Default value for CC dropdown
  bool showButtons = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
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
                    speed: const Duration(milliseconds: 150),
                    text: const ['Hie!', 'Travel light, leave a light footprint !', 'Measure today!'],
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
                    'Turning Wheels, Cutting Emissions',
                    style: kTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Company',
                              style: TextStyle(
                                color: ColorPallete.color3,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: DropdownButtonFormField<String>(
                              value: selectedVehicleType,
                              onChanged: (value) {
                                setState(() {
                                  selectedVehicleType = value!;
                                });
                              },
                              items: vehicleTypes.map((type) {
                                return DropdownMenuItem<String>(
                                  value: type,
                                  child: Text(
                                    type,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                );
                              }).toList(),
                              style: const TextStyle(color: ColorPallete.color3),
                              decoration: const InputDecoration(
                                labelText: 'Select Company',
                                labelStyle: TextStyle(color: ColorPallete.color3),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: ColorPallete.color3),
                                ),
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: ColorPallete.color3,
                                ),
                              ),
                              dropdownColor: ColorPallete.color4,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Vehicle Number',
                              style: TextStyle(
                                color: ColorPallete.color3,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 38.0), // Adjusted padding here
                              child: TextField(
                                controller: input2Controller,
                                keyboardType: TextInputType.text,
                                style: const TextStyle(color: ColorPallete.color3),
                                decoration: const InputDecoration(
                                  labelText: 'Enter Number',
                                  labelStyle: TextStyle(color: ColorPallete.color3),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: ColorPallete.color3),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Vehicle Type',
                              style: TextStyle(
                                color: ColorPallete.color3,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 1.0), // Adjusted padding here
                              child: DropdownButtonFormField<String>(
                                value: selectedType,
                                onChanged: (value) {
                                  setState(() {
                                    selectedType = value!;
                                  });
                                },
                                items: ['Truck', 'Bus', 'Car', 'Bike'].map((cc) {
                                  return DropdownMenuItem<String>(
                                    value: cc,
                                    child: Text(
                                      cc,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  );
                                }).toList(),
                                style: const TextStyle(color: ColorPallete.color3),
                                decoration: const InputDecoration(
                                  labelText: 'Select Type',
                                  labelStyle: TextStyle(color: ColorPallete.color3),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: ColorPallete.color3),
                                  ),
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    color: ColorPallete.color3,
                                  ),
                                ),
                                dropdownColor: ColorPallete.color4,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Vehicle CC',
                              style: TextStyle(
                                color: ColorPallete.color3,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 38.0), // Adjusted padding here
                              child: TextField(
                                controller: input4Controller,
                                keyboardType: TextInputType.text,
                                style: const TextStyle(color: ColorPallete.color3),
                                decoration: const InputDecoration(
                                  labelText: 'Enter CC',
                                  labelStyle: TextStyle(color: ColorPallete.color3),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: ColorPallete.color3),
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    showButtons = false;
                                  });
                                },
                                onEditingComplete: () {
                                  setState(() {
                                    showButtons = true;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Visibility(
        visible: MediaQuery.of(context).viewInsets.bottom == 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, UserInputs.routeName, arguments: 'travel');
              },
              backgroundColor: ColorPallete.cardBackground.withBlue(150),
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'Skip',
                style: TextStyle(
                  color: ColorPallete.color3,
                ),
              ),
            ),
            const SizedBox(width: 270), // Add some space between the buttons
            FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, UserInputs.routeName, arguments: 'travel');
              },
              backgroundColor: ColorPallete.cardBackground.withBlue(150),
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'Next',
                style: TextStyle(
                  color: ColorPallete.color3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

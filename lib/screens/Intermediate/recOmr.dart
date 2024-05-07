import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:CCHAIN/helpers/colors.dart';
import 'package:CCHAIN/screens/calculator/user_inputs.dart';

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

class RecOmr extends StatefulWidget {
  static const String routeName = '/Rec_Omr';

  @override
  _RecOmrState createState() => _RecOmrState();
}

class _RecOmrState extends State<RecOmr> {
  TextEditingController nameController = TextEditingController();
  TextEditingController input1Controller = TextEditingController();
  TextEditingController input2Controller = TextEditingController();
  TextEditingController input3Controller = TextEditingController();
  TextEditingController input4Controller = TextEditingController();
  List<String> vehicleTypes = ['BlueDart', 'DHL', 'Amazon', 'Agarwal Packets'];
  String selectedVehicleType = 'DHL'; // Default value
  String selectedType = 'Plastic'; // Default value for CC dropdown
  bool _isLoading = false;

  void _showLoading() {
    setState(() {
      _isLoading = true;
    });

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
        Navigator.pushNamed(context, UserInputs.routeName, arguments: 'Recycle');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.background,
      body: SafeArea(
        child: Stack(
          children: [
            const Positioned.fill(
              child: FlareActor(
                'assets/flare/base_one.flr',
                animation: 'Flow',
                fit: BoxFit.cover,
              ),
            ),
            SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 250,
                      child: FlareActor(
                        'assets/flare/food_1.flr',
                        animation: 'flow',
                        alignment: Alignment.topCenter,
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
                        text: const ['Hello!', 'Recycle for a greener and cleaner tomorrow!', 'Start today!'],
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
                        'Recycling today for a cleaner tomorrow',
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
                                  icon: Container(),
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
                                  'Meter ID',
                                  style: TextStyle(
                                    color: ColorPallete.color3,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 38.0),
                                  child: TextField(
                                    controller: input2Controller,
                                    keyboardType: TextInputType.text,
                                    style: const TextStyle(color: ColorPallete.color3),
                                    decoration: const InputDecoration(
                                      labelText: 'Enter ID',
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
                                  'Material Type',
                                  style: TextStyle(
                                    color: ColorPallete.color3,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 1.0),
                                  child: DropdownButtonFormField<String>(
                                    value: selectedType,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedType = value!;
                                      });
                                    },
                                    items: ['Glass', 'Plastic', 'Fibre', 'Wood'].map((cc) {
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
                                    icon: Container(),
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
                                  'Ohm ID',
                                  style: TextStyle(
                                    color: ColorPallete.color3,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 38.0),
                                  child: TextField(
                                    controller: input4Controller,
                                    keyboardType: TextInputType.text,
                                    style: const TextStyle(color: ColorPallete.color3),
                                    decoration: const InputDecoration(
                                      labelText: 'Enter ID',
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Visibility(
        visible: MediaQuery.of(context).viewInsets.bottom == 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, UserInputs.routeName, arguments: 'Recycle');
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
            const SizedBox(width: 20),
            FloatingActionButton(
              onPressed: _showLoading,
              backgroundColor: ColorPallete.cardBackground.withBlue(150),
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: _isLoading
                  ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(ColorPallete.color3),
                    )
                  : const Text(
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

import 'package:CCHAIN/helpers/colors.dart';
import 'package:CCHAIN/screens/home/startScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
	static const routeName = "/SplashScreen";

	const SplashScreen({Key? key}) : super(key: key);

	@override
	State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
		with SingleTickerProviderStateMixin {
	@override
	void initState() {
		super.initState();
		SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
		Future.delayed(const Duration(seconds: 3), () {
			Navigator.of(context).pushReplacement(
				MaterialPageRoute(builder: (_) => StartScreen()),
			);
		});
	}

	@override
	void dispose() {
		super.dispose();
		SystemChrome.setEnabledSystemUIMode(
			SystemUiMode.manual,
			overlays: SystemUiOverlay.values,
		);
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Container(
				width: double.infinity,
				decoration: const BoxDecoration(
					gradient: LinearGradient(
						colors: [
							Color(0xFF00008B), // Dark Blue
							Color(0xFF22B422), // Green
						],
						begin: Alignment.topRight,
						end: Alignment.bottomLeft,
					),
				),
				child: Center( // Center widget added here
					child: Column(
						mainAxisAlignment: MainAxisAlignment.center,
						children: [
							Image.asset(
								"assets/images/logo.png", // Change path as per your image location
								height: 150,
								width: 150,
							),
							const SizedBox(height: 20), // Adding space between image and text
							const Text(
								'Carbon chain',
								style: TextStyle(
									color: ColorPallete.color3, // Custom color
									fontSize: 35,
								),
							),
							const SizedBox(height: 20), // Adding space between text and quote
							const Text(
								"Let's measure, reduce, and thrive",
								style: TextStyle(
									color: ColorPallete.color3, // Same color as "Carbon chain"
									fontSize: 20,
								),
							),
						],
					),
				),
			),
		);
	}
}

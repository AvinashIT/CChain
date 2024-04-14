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
	late AnimationController _controller;

	@override
	void initState() {
		super.initState();
		SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
		_controller = AnimationController(
			vsync: this,
			duration: Duration(seconds: 5), // Adjust duration as needed
		)..repeat(); // Make the animation repeat indefinitely

		Future.delayed(const Duration(seconds: 5), () {
			Navigator.of(context).pushReplacement(
				MaterialPageRoute(builder: (_) => StartScreen()),
			);
		});
	}

	@override
	void dispose() {
		_controller.dispose();
		super.dispose();
		SystemChrome.setEnabledSystemUIMode(
			SystemUiMode.manual,
			overlays: SystemUiOverlay.values,
		);
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: AnimatedBuilder(
				animation: _controller,
				builder: (context, child) {
					return SingleChildScrollView(
						child: Container(
							height: MediaQuery.of(context).size.height,
							width: double.infinity,
							decoration: BoxDecoration(
								gradient: LinearGradient(
									colors: const [
										Color(0xFF00008B), // Dark Blue
										Color(0xFF22B422), // Green
									],
									begin: Alignment.topRight,
									end: Alignment.bottomLeft,
									transform: GradientRotation(_controller.value * 2 * 3.14),
								),
							),
							child: Center(
								child: Column(
									mainAxisAlignment: MainAxisAlignment.center,
									children: [
										Image.asset(
											"assets/images/logo.png",
											height: 150,
											width: 150,
										),
										SizedBox(height: 20),
										const Text(
											'Carbon chain',
											style: TextStyle(
												color: ColorPallete.color3,
												fontSize: 35,
												fontWeight: FontWeight.bold, // Match the style for titles like "Manufacture," "Recycle," and "Transport"
											),
										),
										const SizedBox(height: 20),
										const Text(
											"Measurable is Manageable",
											style: TextStyle(
												color: ColorPallete.color3,
												fontSize: 25,
											),
										),
									],
								),
							),
						),
					);
				},
			),
		);
	}
}

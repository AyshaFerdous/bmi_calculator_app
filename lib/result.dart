import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts package
import 'dart:async';

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Animation controller for text animation
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.7, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    double bmi = args['bmi'];

    String getBMICategory() {
      if (bmi < 18.5) {
        return 'Underweight';
      } else if (bmi < 24.9) {
        return 'Normal weight';
      } else if (bmi < 29.9) {
        return 'Overweight';
      } else {
        return 'Obesity';
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Result',
          style: GoogleFonts.acme(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.orangeAccent, // You can adjust the color
        centerTitle: true, // This will center the title
      ),
      body: Stack(
        children: [
          // Full-screen background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/white.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Center content
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white24.withOpacity(0.7), // Semi-transparent background for contrast
                borderRadius: BorderRadius.circular(30), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 15,
                    spreadRadius: 5,
                  ),
                ],
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'YOUR BMI IS',
                    style: GoogleFonts.acme(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    bmi.toStringAsFixed(1),
                    style: GoogleFonts.acme(
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                      color: Colors.orangeAccent,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    getBMICategory(),
                    style: GoogleFonts.acme(
                      fontSize: 28,
                      color: Colors.redAccent,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Animated shadowed text at the bottom
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: ScaleTransition(
              scale: _animation,
              child: Text(
                'Have a Healthy Life',
                textAlign: TextAlign.center,
                style: GoogleFonts.adventPro(
                  fontSize: 32,
                  color: Colors.pinkAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

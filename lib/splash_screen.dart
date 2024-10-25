import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/t.png",
                width: 1300,
                height: 500,),
              SizedBox(height: 10,),
              Text("Check BMI", style: GoogleFonts.agbalumo(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple
              ),),
              SizedBox(height: 15,),

              CircularProgressIndicator(
                color: Colors.red,
              )

            ],
          ),
        )
    );


  }
}

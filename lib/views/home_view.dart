import 'package:flutter/material.dart';
import 'package:weather_app/views/calculator_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const  Scaffold(
      backgroundColor: Colors.deepOrange,
      //SafeArea provides some padding to the app from top and bottom so that we face issue
      body: SafeArea(
        child: Calculator()
        ),
    );
  }
}
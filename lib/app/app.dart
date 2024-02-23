import 'package:flutter/material.dart';
import 'package:weather_app/views/home_view.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator App",
      theme:  ThemeData(
        primarySwatch: Colors.red,
      ),
      home:const HomeView(),
      
    );
  }
}


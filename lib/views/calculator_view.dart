// ignore_for_file: unnecessary_const


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  
  int firstNumber = 0 ;
  int secondNumber = 0 ;
  int result = 0;

  final displayOneController = TextEditingController();
  final displayTwoController = TextEditingController();

  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();
    displayOneController.text = firstNumber.toString();
    displayTwoController.text = secondNumber.toString();

    
    _listener = AppLifecycleListener(
      onShow: _onShow,
      onHide: _onHide,
      onResume: _onResume,
      onDetach: _onDetach,
      onInactive: _onInactive,
      onPause: _onPause,
      onRestart: _onRestart,
      onStateChange: _onStateChanged,
      // onExitRequested: _onExitRequested,

    );
  }

  void _onShow() => print("onShow called");
  void _onHide() => print("onHide called");
  void _onResume() => print("onResume called");
  void _onDetach() => print("onDetach called");
  void _onInactive() => print("onInactive called");
  void _onPause() => print("onPause called");
  void _onRestart() => print("onRestart called");
  void _onStateChanged(AppLifecycleState state) => print("onStateChanged called with state: $state");



  @override
  void dispose() {
    displayOneController.dispose();
    displayTwoController.dispose();
    _listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          //Calcu;ator Display
          DisplayCalculator(hint: "Enter First Number" , controller: displayOneController),
          const SizedBox(height: 16.0,),
          DisplayCalculator(hint: "Enter Second Number" , controller: displayTwoController),
          const SizedBox(height: 16.0,),
          Text(
            key: const Key("Result"),
            result.toString(),
            style:const  TextStyle(
              fontSize: 60.0,
              fontWeight: FontWeight.bold,
            ),
            ),
          const Spacer(),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            
            children: [
                FloatingActionButton(
                onPressed: () {
                  setState(() {
                    result = (num.tryParse(displayOneController.text)! + num.tryParse(displayTwoController.text)!) as int;
                  });
                  
                },
                child: const Icon(CupertinoIcons.add),
                ),


                FloatingActionButton(
                onPressed: () {
                  setState(() {
                    result = (num.tryParse(displayOneController.text)! - num.tryParse(displayTwoController.text)!) as int;
                  });
                  
                },
                child: const Icon(CupertinoIcons.minus),
                ),


                FloatingActionButton(
                onPressed: (){
                  setState(() {
                    result = (num.tryParse(displayOneController.text)! * num.tryParse(displayTwoController.text)!) as int;
                  });
                  
                },
                child: const Icon(CupertinoIcons.multiply),
                ),


                FloatingActionButton(
                onPressed: () {
                  setState(() {
                  result = (num.tryParse(displayOneController.text)! ~/ num.tryParse(displayTwoController.text)!) ;
                  });
                  
                },
                child: const Icon(CupertinoIcons.divide),
                ),
            ],

          ),
          const SizedBox(height: 16.0,),
          FloatingActionButton.extended(
            onPressed: () {
              setState(() {
                firstNumber = 0;
                secondNumber = 0;
                displayOneController.clear();
                displayTwoController.clear();
                result = 0;
              });
            },
            label: const Text("Clear"),
            ),
          //Expand
          //Calculator Buttons
        ],
      ),
    );
  }
}

class DisplayCalculator extends StatelessWidget {
  const DisplayCalculator({
    super.key,
    this.hint= "Enter number here",
    required this.controller,
  });

  final String? hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      autofocus: true,
      decoration: InputDecoration(
    
        focusedBorder: const OutlineInputBorder(
          borderSide:   BorderSide(
            color: Colors.amber, width: 2.0
            ),
        ),
    
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.amber, width: 1.0
            ),
        ),
        hintText: hint,
    )
    );
  }
}
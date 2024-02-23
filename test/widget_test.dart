

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/app/app.dart';

void main(){
  testWidgets("Weather App Test", (WidgetTester tester) async{
    await tester.pumpWidget(const App());
    //for triggering the build method

    expect(find.byKey(const Key("Result")), findsOneWidget);
    //expect(find.text("Weather App"), findsOneWidget);

  });
}
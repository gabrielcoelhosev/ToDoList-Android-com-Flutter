import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/main.dart'; 

void main() {
  testWidgets('Adicionar tarefa à lista', (WidgetTester tester) async {

    await tester.pumpWidget(MyApp());


    expect(find.byType(TextField), findsOneWidget);
    expect(find.text('Adicionar'), findsOneWidget);


    await tester.enterText(find.byType(TextField), 'Minha nova tarefa');
    await tester.tap(find.text('Adicionar'));
    await tester.pump();


    expect(find.text('Minha nova tarefa'), findsOneWidget);
  });
}


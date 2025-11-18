import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';

var kcolorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 32, 33, 33),
);
var kcolorScheme2 = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 27, 179, 141),
);
var kcolorScheme3 = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 243, 255, 252),
);
void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: kcolorScheme,
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: kcolorScheme3.primaryContainer,
          ),
        ),
        cardTheme: CardThemeData(margin: EdgeInsets.all(20)),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kcolorScheme.primaryContainer,
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: kcolorScheme3.onPrimaryContainer,
        ),
      ),
      home: Expenses(),
    ),
  );
}

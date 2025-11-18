import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';

var kcolorScheme4 = const ColorScheme.dark(
  primary: Colors.black,
  primaryContainer: Colors.grey,
  onPrimary: Colors.white,
  onPrimaryContainer: Colors.black,
  secondary: Colors.grey,
  onSecondary: Colors.white,
  background: Colors.white,
  onBackground: Colors.black,
  surface: Colors.white,
  onSurface: Colors.black,
  error: Colors.red,
  onError: Colors.white,
);

var nColorScheme = const ColorScheme.dark(
  primary: Colors.black,
  primaryContainer: Colors.grey,
  onPrimary: Colors.white,
  onPrimaryContainer: Colors.black,
  // …
);

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: kcolorScheme4,

        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: kcolorScheme4.onPrimary,
          ),
          displayMedium: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: kcolorScheme4.primary,
          ),
          displaySmall: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w300,
            color: kcolorScheme4.primary,
          ),
        ),

        cardTheme: const CardThemeData(
          margin: EdgeInsets.all(20),
          elevation: 10,
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kcolorScheme4.onPrimary,
            //foregroundColor: kcolorScheme4.onPrimary,
          ),
        ),

        appBarTheme: AppBarTheme(
          backgroundColor: kcolorScheme4.onPrimaryContainer,
        ),
      ),
      home: Expenses(),
    ),
  );
}

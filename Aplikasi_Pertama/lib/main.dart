import 'package:aplikasi_pertama/providers/authprovider.dart';
import 'package:aplikasi_pertama/providers/passwordvisibilityprovider.dart';
import 'package:aplikasi_pertama/screens/firstscreen.dart';
import 'package:aplikasi_pertama/screens/loginscreen.dart';
import 'package:aplikasi_pertama/screens/registerscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => PasswordVisibilityProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.interTextTheme(),
        ),
        debugShowCheckedModeBanner: false,
        home: const Firstscreen(),
        routes: {
          '/login': (context) => LoginScreen(),
          '/register': (context) => RegisterScreen()
        },
      ),
    ),
  );
}



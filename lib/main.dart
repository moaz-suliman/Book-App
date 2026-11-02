import 'package:first_project/feature/home/presintation/provider/book_provider.dart';
import 'package:first_project/feature/splash/presintation/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => BookProvider(),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: SplashView()),
    ),
  );
}

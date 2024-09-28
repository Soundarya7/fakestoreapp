import 'package:fakestoreapp/Screens/Details.dart';
import 'package:fakestoreapp/Screens/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fake Store',
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color(0xFF6418C3),
            ),
          ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
        routes: {
         '/': (context) => const Home(),
        // '/details': (BuildContext context) {
        //   return const DetailsScreen();
        // }
      }
      
    );
  }
}

   
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_website/providers/books_provider.dart';
import 'package:flutter_website/providers/projects_provider.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProjectsProvider()),
        ChangeNotifierProvider(create: (_) => BooksProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _firebaseInitialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _firebaseInitialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                accentColor: Color(0xFF00FFC2),
                textTheme: TextTheme(
                  headline1: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Source San Pro',
                      fontSize: 36,
                      fontWeight: FontWeight.w700),
                  caption: TextStyle(
                      color: Color(0xFF00FFC2),
                      fontFamily: 'Montserrat',
                      fontSize: 28,
                      fontWeight: FontWeight.w700),
                  headline2: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                  bodyText1: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ),
              home: HomePage(),
            );
          }
          return Container();
        });
  }
}

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/control/newscategoriesprovider.dart';
import 'package:news/view/screens/homescreen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'control/newsprovider/API.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
        ChangeNotifierProvider(create: (context) => NewsProvider(),),
        ChangeNotifierProvider(create: (context) => NewsCategoriesProvider()),



    ],
    child:
      MaterialApp(
        title: 'News',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
            primarySwatch: Colors.blue,
            textTheme:GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)


        ),
        home: AnimatedSplashScreen(
          splash: Center(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset('assets/images/newsSplashScreen.png',fit:BoxFit.cover),

            ),
          ),
          splashIconSize: double.infinity,
          duration: 4000,
          nextScreen: HomeScreen(),
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.bottomToTop,
        )
      )
    );

  }
}


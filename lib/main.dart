import 'package:assignment4final/app_provider.dart';
import 'package:assignment4final/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return ChangeNotifierProvider<AppProvider>(
      create: (context){
        return AppProvider();
      },
          child: MaterialApp(
        debugShowCheckedModeBanner: false ,
        home: SplashScreen(),
      ),
    );

  }
}



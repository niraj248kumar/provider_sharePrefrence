import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_share_pref/provider/provide_home.dart';
import 'package:provider_share_pref/share_pref/Splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => ProviderPages() ,
        child:MaterialApp(
          home: SplashScreen(),
        ),);


  }
}



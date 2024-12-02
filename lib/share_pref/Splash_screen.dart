import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_share_pref/provider/provide_home.dart';
import 'package:provider_share_pref/share_pref/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../register/Login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashScreen();

  }

  Future<void> splashScreen() async{
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var provider = Provider.of<ProviderPages>(context,listen: false);
      provider.register_splash(context);
    },);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.redAccent,
    );
  }
}

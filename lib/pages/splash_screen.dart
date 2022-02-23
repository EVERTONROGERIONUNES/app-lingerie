import 'package:agenda_contatos/pages/basescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    Future.delayed(Duration(seconds: 4)).then((_) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => BaseScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black87,
        child: Center(
          child: Container(
            width: 1920,
            height: 1080,
            child: Image.asset("img/icon.png"),
          ),
        ));
  }
}

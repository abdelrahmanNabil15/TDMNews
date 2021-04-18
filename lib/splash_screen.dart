import 'package:flutter/material.dart';
import 'dart:async';

import 'package:news/veiws/home.dart';
import 'package:shimmer/shimmer.dart';




class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();

    _mockCheckForSession().then(
            (status) {
          if (status) {
            _navigateToHome();
          }
        }
    );
  }


  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(milliseconds: 6000), () {});

    return true;
  }

  void _navigateToHome(){
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (BuildContext context) =>  Home(),
        )
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Opacity(
                opacity: 0.5,
              child: Image.network(
                'https://images.unsplash.com/photo-1485115905815-74a5c9fda2f5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=361&q=80',
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
            ),

            Shimmer.fromColors(
              period: Duration(milliseconds: 1500),
              baseColor: Colors.black,
              highlightColor:Colors.brown,
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "black hills  pioneer",

                  style: TextStyle(
                      fontSize: 90.0,
                      fontFamily: 'Pacifico',

                      shadows: <Shadow>[
                        Shadow(
                            blurRadius: 18.0,
                            color: Colors.black87,
                            offset: Offset.fromDirection(140, 12)
                        )
                      ]
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


}
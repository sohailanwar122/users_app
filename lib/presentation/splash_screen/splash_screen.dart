import 'dart:async';
import 'package:flutter/material.dart';
import 'package:users_app/global/global.dart';
import 'package:users_app/presentation/auth/login_screen/login_screen.dart';
import 'package:users_app/presentation/navbar/navbar_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen>
{

  startTimer()
  {
    // fAuth.currentUser != null ? AssistantMethods.readCurrentOnlineUserInfo() : null;

    Timer(const Duration(seconds: 3), () async
    {
      if(await fAuth.currentUser != null)
      {
        currentFirebaseUser = fAuth.currentUser;
        Navigator.push(context, MaterialPageRoute(builder: (c)=> const NavBarScreen()));
      }
      else
      {
        Navigator.push(context, MaterialPageRoute(builder: (c)=> const LoginScreen()));
      }
    });
  }


  @override
  void initState() {
    super.initState();
    startTimer();
  }
  @override
  Widget build(BuildContext context) {
    return
      Material(
        child: Container(
          color: Colors.black,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Image.asset("images/logo.png"),

                const SizedBox(height: 10,),

                const Text(
                  "Uber & inDriver Clone App",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),

              ],
            ),
          ),
        ),
      );
  }
}

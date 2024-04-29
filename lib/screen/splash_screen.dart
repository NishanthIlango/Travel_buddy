import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/screen/post_screen.dart';

class SplashScreen extends StatefulWidget {
  static String routeName="/splashscreen";
  const SplashScreen({Key? key}):super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _navigate()async{
   await Future.delayed(const Duration(seconds: 1)).then((value){
    Navigator.of(context).pushReplacementNamed(PostScreen.routeName);
   });
   
  }

  @override
  void initState() {
    _navigate();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(FirebaseAuth.instance.currentUser==null);
    return Scaffold(
      body:Stack(
        children: [
           Positioned(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image1.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          Positioned(
              top: 270,
              child: Padding(
                padding: const EdgeInsets.all(45.0),
                child: RichText(
                  text: TextSpan(
                    text: "Travel",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 440,
              child: Padding(
                padding: const EdgeInsets.all(45.0),
                child: RichText(
                  text: TextSpan(
                    text: "     Buddy",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
            ),
        ],
      )
    );
  }
}
import 'package:flutter/material.dart';
import '/view/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Login()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width *0.02,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset('assets/images/shopping-logo.png',height: 150,width: 150,),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height *0.04,
              ),
              const Text(
                'Shopping Cart',
                style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 211, 132, 13),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
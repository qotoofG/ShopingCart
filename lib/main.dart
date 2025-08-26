import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:tranning_2/firebase_options.dart';
import 'package:tranning_2/view/splash_screen.dart';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext ? context){
    return super.createHttpClient(context)..badCertificateCallback=
    (X509Certificate cert,String host,int port)=>true;
  }
}

Future<void> main() async {
  Stripe.publishableKey ="pk_test_51PsKOk01QE1JwKBQUJymmj4aTjgIacQM1upxCOiweIEArooRpreybRE4s2Cc8sVkQJC9lPxLE4DCOu5G0epIK2kP008kqX1dsY";
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global=MyHttpOverrides();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: false,
      ),
      home:const SplashScreen(),
    );
  }
}
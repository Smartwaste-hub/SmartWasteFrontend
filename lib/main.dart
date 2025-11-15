import 'package:flutter/material.dart';
import 'package:smartwastefrontend/complaint.dart';
import 'package:smartwastefrontend/login.dart';
import 'package:smartwastefrontend/registration.dart';
import 'package:smartwastefrontend/scanqrcode.dart';
import 'package:smartwastefrontend/viewprofile.dart';
import 'package:smartwastefrontend/viewreward&transactionhistory.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
     
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: QRScannerPage()
    );
  }
}

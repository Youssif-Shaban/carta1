import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FineDetails extends StatelessWidget {
  var name;
  var pass;
  var mail;
  var car;
  // double result;
  // bool istabe;
  // int age;

  FineDetails({
    required this.name,
    required this.pass,
    required this.mail,
    required this.car,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text("your name : $name"),
          Text("your pass : $pass"),
          Text("your mail : $mail"),
          Text("your name : $name"),
        ],
      ),
    );
  }
}

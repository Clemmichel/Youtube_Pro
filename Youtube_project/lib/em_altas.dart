import 'package:flutter/material.dart';

class em_alta extends StatefulWidget {
  const em_alta({super.key});

  @override
  State<em_alta> createState() => _em_altaState();
}

class _em_altaState extends State<em_alta> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Em alta",
        style: TextStyle (
          fontSize: 25

        ) ,
        ),
      
      ),
    );
  }
}


import 'dart:math';

import 'package:flutter/material.dart';


class RandomColor extends StatefulWidget {
  const RandomColor({super.key});

  @override
  State<RandomColor> createState() => _RandomColorState();
}

class _RandomColorState extends State<RandomColor> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  Color _color = Colors.black;

  @override
  void initState(){
    super.initState();
    setState(() {
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 100));
    _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        title: const Text('Random Color'),
        centerTitle: true,
        backgroundColor: Colors.cyanAccent,
      ),
      body: GestureDetector(
        onTap: (){
          setState(() {
            //generate random function
            final random = Random();
            //generate the random color
            _color = Color.fromRGBO(
                random.nextInt(256),
                random.nextInt(256),
               random.nextInt(256),
              1
            );

          });
        },
        child: Container(
         color: _color,
        ),
      ),
    );
  }
}

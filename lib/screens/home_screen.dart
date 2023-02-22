import 'package:flutter/material.dart';
import 'package:news_app/constraints/constraint_colors.dart';

class HomeScreen extends StatelessWidget {
const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: newsBGColor,
      appBar: AppBar(
        title: const Text('My News Friend'),
      ),
      body: Container(),
    );
  }
}
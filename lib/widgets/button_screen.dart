import 'package:flutter/material.dart';

class ButtonScreen extends StatelessWidget {
  const ButtonScreen({super.key, required this.onPressed, required this.txt});
  final VoidCallback onPressed;
  final String txt;


  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(15)
              )
              
            ),

             child: Container(
              width: double.infinity,
              height: 50,
              color: Colors.black,
              child: Center(
                child: Text(txt,
                ),
              ),
              ),
             );
  }
}
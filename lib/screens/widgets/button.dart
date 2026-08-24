import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final VoidCallback ontap;

  const MyButton({super.key, required this.title, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 55),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10),
          
        ),
        backgroundColor: Colors.blueGrey.shade300.withAlpha(50),
      ),
      onPressed:ontap, child: Text(title,
    style: TextStyle(fontSize: 18,
    color: Colors.white,
    fontWeight: FontWeight.w700,),
    ));
  }
}

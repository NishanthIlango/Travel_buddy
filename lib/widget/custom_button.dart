import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const CustomButton({Key? key,required this.onPressed,required this.title}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10),
      child: MaterialButton(
        onPressed: onPressed,
        height: 60,
        minWidth: double.infinity,
        color: const Color(0xFF1e5376),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Text(title,style: const TextStyle(
          color: Colors.white,
          fontSize:18,
        ),),
        
      ),
    );
  }
}
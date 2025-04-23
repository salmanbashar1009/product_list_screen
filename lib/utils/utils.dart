import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils{
 static Widget primaryButton({required BuildContext context,required String title, required VoidCallback onPressed, double? height,}){
    return SizedBox(
      height: height,
      width: double.infinity,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pinkAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              )
          ),
          child: Text(title,style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),)),
    );
  }
}
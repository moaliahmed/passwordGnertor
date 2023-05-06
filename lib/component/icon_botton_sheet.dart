import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class iconButtonSheet extends StatelessWidget {
  const iconButtonSheet({super.key, required this.icon, required this.text, required this.function});
final icon;
final String text;
final  function;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,size: 42,),
          SizedBox(height: 20,),
          Text(text)
        ],
      ),
    );
  }
}
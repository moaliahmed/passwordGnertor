import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:passwordgnerator/component/text_field_commponent.dart';

class changePasswordBttonSheet extends StatelessWidget {
  const changePasswordBttonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          textFieldComponent(hint: 'Enter new password'),
          textFieldComponent(hint: 'Enter new password')
        
        ],
      ),
    );
  }
}
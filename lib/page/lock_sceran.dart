import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:passwordgnerator/page/history_screan.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class LockScrean extends StatelessWidget {
  LockScrean({super.key});
  final number = TextEditingController();
  final pin = '1234';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        width: 260,
        child: PinCodeTextField(
          keyboardType: TextInputType.number,
          appContext: context,
          length: 4,
          pinTheme: PinTheme(
            borderRadius: BorderRadius.circular(12),
            shape: PinCodeFieldShape.box,
          ),
          controller: number,
          onChanged: (value) {},
          onCompleted: (value) {
            if (value == pin) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HistoryScrean(),
                ),
              );
            } else {
              Navigator.pop(context);
            }
          },
        ),
      )),
    );
  }
}

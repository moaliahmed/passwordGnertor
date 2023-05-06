import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class textFieldComponent extends StatelessWidget {
  const textFieldComponent({super.key, required this.hint, this.color=Colors.black, this.onsaved  });
final String hint;
final Color color;
final void Function(String?)? onsaved;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
                        onSaved: onsaved ,
                        validator: (value) {
                          if (value?.isEmpty??true){
                            return 'Filed is required';
                          }else{
                            return null;
                          }
                        },
                        cursorColor: color,
                        style: TextStyle(color: color, fontSize: 18),
                        decoration: InputDecoration(
                          focusColor: Colors.black,
                          border:const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              borderSide: BorderSide(color: Colors.white)),
                          labelText: hint,
                          labelStyle:  TextStyle(color: color),
                        ),
                      );
  }
}
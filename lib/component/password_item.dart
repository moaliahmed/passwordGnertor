import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passwordgnerator/bloc/viewPassword/view_password_cubit.dart';
import 'package:passwordgnerator/model/passwordModel.dart';

class passwordItem extends StatefulWidget {
  const passwordItem({super.key, required this.password});
final passwordModel password;

  @override
  State<passwordItem> createState() => _passwordItemState();
}

class _passwordItemState extends State<passwordItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 16, top: 20, bottom: 20),
        margin: EdgeInsets.symmetric(horizontal:12 ,vertical:8 ),
        decoration: BoxDecoration(
            color: Color(0xff0a2d4d), borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${widget.password.email}', //title
                    style: const TextStyle(color: Colors.white, fontSize: 26),
                  ),
                   IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                 widget.password.delete();
                 BlocProvider.of<ViewPasswordCubit>(context).viewData();
                
                },
              ),
                ],
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${widget.password.password}', //Subtitle
                      style: TextStyle(
                          color: Colors.white.withOpacity(.5), fontSize: 20),
                    ),
                    IconButton(icon:Icon(Icons.copy,
                        size: 30,
                        color: Colors.white.withOpacity(.5),) ,
                        onPressed: () {
                          final value =ClipboardData(text: widget.password.password);
                          Clipboard.setData(value);
                        },
                        
                      )
                  ],
                ),
              ),
              
            ),
           
          ],
        ),
      )
    ;
  }
}
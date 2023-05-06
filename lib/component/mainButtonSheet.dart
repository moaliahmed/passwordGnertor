import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:passwordgnerator/component/addPasswordButtonSheet.dart';
import 'package:passwordgnerator/component/changePasswordButtonSheet.dart';
import 'package:passwordgnerator/component/icon_botton_sheet.dart';

class mainButtonSheet extends StatelessWidget {
  const mainButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          iconButtonSheet(
              icon: Icons.add,
              text: 'Add Password',
              function: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  context: context,
                  builder: (context) => addPasswordButtonSheet(),
                );
              }),
          iconButtonSheet(
              icon: Icons.settings,
              text: 'Change Password',
              function: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  context: context,
                  builder: (context) => changePasswordBttonSheet(),
                );
              })
        ],
      ),
    );
  }
}

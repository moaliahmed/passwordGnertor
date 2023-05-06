import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passwordgnerator/bloc/savePassword/cubit/save_password_cubit.dart';
import 'package:passwordgnerator/component/boton_component.dart';
import 'package:passwordgnerator/component/text_field_commponent.dart';
import 'package:passwordgnerator/model/passwordModel.dart';
import 'package:passwordgnerator/page/history_screan.dart';

import '../bloc/viewPassword/view_password_cubit.dart';

class addPasswordButtonSheet extends StatelessWidget {
  const addPasswordButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<SavePasswordCubit, SavePasswordState>(
      listener: (context, state) {
        if (state is SavePasswordSuccess)
        {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return  Padding(
          padding: EdgeInsets.only(left: 16,right: 16,bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(child: addPasswordForm()),
        );
      },
    );
  }
}





class addPasswordForm extends StatefulWidget {
  const addPasswordForm({
    super.key,
  });

  @override
  State<addPasswordForm> createState() => _addPasswordFormState();
}

class  _addPasswordFormState extends State<addPasswordForm> {
  final GlobalKey<FormState> formKey=GlobalKey();
   AutovalidateMode autovalidateMode= AutovalidateMode.disabled;
   String? email,password;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
         const SizedBox(height: 22,),
          textFieldComponent(hint: 'Enter Email',onsaved: (p0) => email=p0,),
         const  SizedBox(height: 22,),
          textFieldComponent(hint: 'Enter password',onsaved: (p0) => password=p0,),
         const SizedBox(height: 22,),
        BottonComponent(text: 'Save',function: (){
          if(formKey.currentState!.validate()){
            formKey.currentState!.save();
            var passwordm=passwordModel(email:email!,password: password! );
            BlocProvider.of<SavePasswordCubit>(context).addPassword(passwordm);
            BlocProvider.of<ViewPasswordCubit>(context).viewData();
            
          }else{
            autovalidateMode=AutovalidateMode.always;
          }
        } ,),const SizedBox(height: 22,)
        ],
      ),
    );
  }
}
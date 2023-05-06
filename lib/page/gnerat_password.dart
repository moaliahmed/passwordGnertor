import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:passwordgnerator/bloc/genratePassword/generat_random_password_cubit.dart';
import 'package:passwordgnerator/bloc/savePassword/cubit/save_password_cubit.dart';
import 'package:passwordgnerator/bloc/viewPassword/view_password_cubit.dart';

import 'package:passwordgnerator/colors/app_colors.dart';
import 'package:passwordgnerator/component/text_field_commponent.dart';
import 'package:passwordgnerator/config/toast_config.dart';
import 'package:passwordgnerator/enums/toast_states.dart';
import 'package:passwordgnerator/model/passwordModel.dart';
import 'package:passwordgnerator/page/lock_sceran.dart';

class GneratPassword extends StatefulWidget {
  const GneratPassword({super.key});

  @override
  State<GneratPassword> createState() => _GneratPasswordState();
}

class _GneratPasswordState extends State<GneratPassword> {
  List item = [
    'Random Password',
    'PIN',
  ];
  @override
  void initState() {
    BlocProvider.of<GeneratRandomPasswordCubit>(context).updataPassword();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var nheight = MediaQuery.of(context).size.height;
    var cubit = GeneratRandomPasswordCubit.get(context);
    String password=cubit.gnertatPassword;
    return Scaffold(
      body: BlocProvider(
        create: (context) => GeneratRandomPasswordCubit(),
        child: Container(
          height: (nheight * 6) / 7,
          decoration: const BoxDecoration(
              color: Color(0xff0a2d4d),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(42),
                  bottomRight: Radius.circular(42))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Need a Password?\n try the 1Password ',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 22,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Container(
                  height: 54,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 1, color: Colors.white)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          password,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(icon:Icon(Icons.copy,
                        size: 30,
                        color: AppColor.blueColor,) ,
                        onPressed: () {
                          final value =ClipboardData(text: password);
                          Clipboard.setData(value);
                        },
                        
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 22,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Text('Password Length',
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 300,
                        child: Slider(
                            value: cubit.currentSliderValue,
                            max: 20,
                            label: cubit.currentSliderValue.round().toString(),
                            onChanged: (double value) {
                              setState(() {
                                cubit.currentSliderValue = value;
                                BlocProvider.of<GeneratRandomPasswordCubit>(
                                        context)
                                    .updataPassword();
                              });
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 18),
                        child: Container(
                          width: 60.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border:
                                  Border.all(width: 1, color: Colors.blueGrey)),
                          child: Center(
                            child: Text(
                              '${cubit.currentSliderValue.toInt()}',
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text('Password Type',
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                    Row(
                      children: [
                        DropdownButton(
                          value: cubit.selectedItem,
                          items: item
                              .map(
                                (e) => DropdownMenuItem<String>(
                                  value: e,
                                  child: Text(
                                    e,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              cubit.selectedItem = value;
                            });
                          },
                        ),
                        Spacer(),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                cubit.updataPassword();
                              });
                            },
                            icon: Icon(
                              Icons.replay_outlined,
                              color: Colors.white,
                            )),
                        Spacer(),
                        Column(
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  activeColor: Colors.blue,
                                  value: cubit.checkNumber,
                                  onChanged: (e) {
                                    setState(
                                      () {
                                        cubit.checkNumber = e;
                                      },
                                    );
                                  },
                                ),
                                Text(
                                  'Number',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  activeColor: Colors.blue,
                                  value: cubit.checkSymbol,
                                  onChanged: (e) {
                                    setState(
                                      () {
                                        cubit.checkSymbol = e;
                                      },
                                    );
                                  },
                                ),
                                Text(
                                  'Symble',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18),
                child: addPasswordForm(pass: password),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      LockScrean(),
                ));
          },
          child: Icon(Icons.lock_outline)),
    );
  }
}

class addPasswordForm extends StatefulWidget {
   addPasswordForm({
    super.key,
    required this.pass
  });
  String pass;

  @override
  State<addPasswordForm> createState() => _addPasswordFormState();
}

class _addPasswordFormState extends State<addPasswordForm> {
  String? hint;
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SavePasswordCubit, SavePasswordState>(
      listener: (context, state) {
         if (state is SavePasswordSuccess){
            ToastConfig.showToast(msg: 'Saved Success', toastStates: ToastStates.Success);
          }

      },
      builder: (context, state) {
        return Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  width: 300,
                  child: textFieldComponent(
                    hint: 'Enter Email',
                    color: Colors.white,
                    onsaved: (p0) => hint = p0,
                  )),
              ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      String password=BlocProvider.of<GeneratRandomPasswordCubit>(context).gnertatPassword;
                      var passwordm =
                          passwordModel(email: hint!, password:widget.pass );
                      BlocProvider.of<SavePasswordCubit>(context)
                          .addPassword(passwordm);
                          
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                    }
                  },
                  child: const Text(
                    'Save',
                    style: TextStyle(fontSize: 18),
                  ))
            ],
          ),
        );
      },
    );
  }
}
